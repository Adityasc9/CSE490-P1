`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 07:36:13 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input wire[3:0] Opcode,
    output wire[1:0] Branch,
    output wire Jump,
    output wire MemRead,
    output wire MemWrite,
    output wire ALUSrc,
    output wire MemtoReg,
    output wire RegWrite,
    output wire[1:0] ALUOp
    );
    
    reg [9:0] csLUT [0:15];
    reg [9:0] cntrl_sig;
    integer i;
    
    initial
    begin
        csLUT[0] = 10'b0000000101; // add, sub, sll, and
        csLUT[1] = 10'b0001011100; // lw
        csLUT[2] = 10'b0000110000; // sw
        csLUT[3] = 10'b0000010100; // addi
        csLUT[4] = 10'b1000000001; // beq
        csLUT[5] = 10'b0100000001; // bne
        csLUT[6] = 10'b0010000000; // jmp
        
        for (i = 7; i < 16; i = i + 1) begin
            csLUT[i] = 10'b0000000000;
        end
    end
    
    always@ (Opcode)
    begin
        cntrl_sig = csLUT[Opcode];
    end
    
    assign Branch = cntrl_sig[9:8];
    assign Jump = cntrl_sig[7];
    assign MemRead = cntrl_sig[6];
    assign MemWrite = cntrl_sig[5];
    assign ALUSrc = cntrl_sig[4];
    assign MemtoReg = cntrl_sig[3];
    assign RegWrite = cntrl_sig[2];
    assign ALUOp = cntrl_sig[1:0];
endmodule
