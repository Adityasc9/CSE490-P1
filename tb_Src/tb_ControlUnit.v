`timescale 1ns / 1ps

module tb_ControlUnit;
    reg  [3:0] Opcode;
    wire [1:0] Branch;
    wire       Jump, MemRead, MemWrite, ALUSrc, MemtoReg, RegWrite;
    wire [1:0] ALUOp;

    ControlUnit uut(.Opcode(Opcode), .Branch(Branch), .Jump(Jump),
                    .MemRead(MemRead), .MemWrite(MemWrite), .ALUSrc(ALUSrc),
                    .MemtoReg(MemtoReg), .RegWrite(RegWrite), .ALUOp(ALUOp));

    task check;
        input [3:0] op;
        input [63:0] name_str; // just for display
        begin
            Opcode = op; #10;
            $display("Op=%b (%s): Branch=%b Jump=%b MemR=%b MemW=%b ALUSrc=%b M2R=%b RegW=%b ALUOp=%b",
                      Opcode, name_str, Branch, Jump, MemRead, MemWrite, ALUSrc, MemtoReg, RegWrite, ALUOp);
        end
    endtask

    initial begin
        check(4'b0000, "R-type"); // RegWrite=1, ALUOp=10
        check(4'b0001, "lw    "); // MemRead=1, MemtoReg=1, ALUSrc=1, RegWrite=1, ALUOp=00
        check(4'b0010, "sw    "); // MemWrite=1, ALUSrc=1, ALUOp=00
        check(4'b0011, "addi  "); // ALUSrc=1, RegWrite=1, ALUOp=00
        check(4'b0100, "beq   "); // Branch[1]=1, ALUOp=01
        check(4'b0101, "bne   "); // Branch[0]=1, ALUOp=01
        check(4'b0110, "jmp   "); // Jump=1
        $finish;
    end
endmodule
