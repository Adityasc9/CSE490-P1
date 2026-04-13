`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 09:30:20 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(
    input wire Clock,
    output wire [15:0] led
    );
    
    // Program Counter
    wire [15:0] pc_nextaddr;
    wire [15:0] pc_curraddr;
    PC pc(.NextAddr(pc_nextaddr), .Clock(Clock), .CurrAddr(pc_curraddr));

    assign led = pc_curraddr;
    
    // Instruction Memory
    wire [3:0] im_opcode;
    wire [3:0] im_rs;
    wire [3:0] im_rt;
    wire [3:0] im_funct;
    wire [3:0] im_immed;
    wire [11:0] im_jmpoffset;
    InstructionMemory instruction_memory(.Addr(pc_curraddr), .Opcode(im_opcode), .Rs(im_rs), .Rt(im_rt), 
                                         .Funct(im_funct), .Immed(im_immed), .JmpOffset(im_jmpoffset)
                                         );
    
    // Register File
    wire [15:0] regfile_regdata1;
    wire [15:0] regfile_regdata2;
    wire [15:0] regfile_writedata;
    wire cntrl_regwrite;
    RegisterFile register_file (.ReadReg1(im_rs), .ReadReg2(im_rt), .WriteData(regfile_writedata), .Cntrl_RegWrite(cntrl_regwrite), 
                                .Clock(Clock), .RegData1(regfile_regdata1), .RegData2(regfile_regdata2)
                                );
    
    // Sign Extender
    wire [15:0] immed_ext;
    SignExtender sign_extender(.ImmediateIn(im_immed), .ImmediateOut(immed_ext));
    
    // ALU Control
    wire [1:0] cntrl_aluop;
    wire [2:0] alu_operation;
    ALUControl alu_cntrl(.ALUOp(cntrl_aluop), .Funct(im_funct), .Operation(alu_operation));

    // ALU Source MUX
    wire cntrl_alusrc;
    wire [15:0] mux_alusrc_out;
    MUX2to1 mux_alusrc(.A(regfile_regdata2), .B(immed_ext), .Select(cntrl_alusrc), .Out(mux_alusrc_out));
    
    // ALU
    wire [15:0] alu_result;
    wire [1:0] alu_flags;
    ALU alu(.A(regfile_regdata1), .B(mux_alusrc_out), .Operation(alu_operation), .Result(alu_result), .Flags(alu_flags));
    
    // Data Memory
    wire cntrl_memread;
    wire cntrl_memwrite;
    wire [15:0] datamem_out;
    DataMemory data_memory(.Addr(alu_result), .DataIn(regfile_regdata2), .MemRead(cntrl_memread), .MemWrite(cntrl_memwrite), .Clock(Clock), .DataOut(datamem_out)); 
    
    // Register Source MUX
    wire cntrl_memtoreg;
    MUX2to1 mux_regsrc(.A(alu_result), .B(datamem_out), .Select(cntrl_memtoreg), .Out(regfile_writedata));
    
    // Left Shift Sign-Extended Immediate
    wire [15:0] immed_shift;
    LeftShifter leftshift_immed(.DataIn(immed_ext), .DataOut(immed_shift));
    
    // PC Adder
    wire [15:0] plustwo = 16'h0002;
    wire [15:0] pc_incdaddr;
    Adder adder_pc(.A(pc_curraddr), .B(plustwo), .Result(pc_incdaddr));
    
    // Branch Adder
    wire [15:0] branch_addr;
    Adder adder_branch(.A(pc_incdaddr), .B(immed_shift), .Result(branch_addr));
    
    // Branch Logic
    wire [1:0] cntrl_branch;
    wire branchlogic_result;
    BranchLogic branch_logic(.BranchCntrl(cntrl_branch), .ALUFlags(alu_flags), .Result(branchlogic_result));
          
    // Branch MUX
    wire [15:0] mux_branch_result;
    MUX2to1 mux_branch(.A(pc_incdaddr), .B(branch_addr), .Select(branchlogic_result), .Out(mux_branch_result));
    
    // Jump Shifter
    wire [15:0] jmpoffset_shift;
    LeftShifter leftshift_jmpoffset(.DataIn({{4{0}}, im_jmpoffset}), .DataOut(jmpoffset_shift));
    
    // Jump Logic
    wire [15:0] jump_addr;
    JumpLogic jump_logic(.PC(pc_incdaddr), .Offset(jmpoffset_shift), .Result(jump_addr));
    
    // Jump MUX
    wire cntrl_jump;
    MUX2to1 mux_jump(.A(mux_branch_result), .B(jump_addr), .Select(cntrl_jump), .Out(pc_nextaddr));
    
    // Control Unit
    ControlUnit cntrl_unit(.Opcode(im_opcode), .Branch(cntrl_branch), .Jump(cntrl_jump), 
                           .MemRead(cntrl_memread), .MemWrite(cntrl_memwrite), .ALUSrc(cntrl_alusrc),
                           .MemtoReg(cntrl_memtoreg), .RegWrite(cntrl_regwrite), .ALUOp(cntrl_aluop)
                          );

endmodule