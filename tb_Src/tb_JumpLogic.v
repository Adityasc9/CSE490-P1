`timescale 1ns / 1ps


// Spec: jmp_addr = PC_plus2 + sign_extend(offset<<1)
module tb_JumpLogic;
    reg  [15:0] PC, Offset;
    wire [15:0] Result;

    JumpLogic uut(.PC(PC), .Offset(Offset), .Result(Result));

    initial begin
        
        PC = 16'h000E; Offset = 16'h0004; #10;
        $display("PC=000E Offset=0004: Result=0x%04h (expect 0012)", Result);

        // PC=0x000E, raw offset=0x0002 shifted=0x0004 target=0x0012
        PC = 16'h000E; Offset = 16'h0002; #10;
        $display("PC=000E Offset=0002: Result=0x%04h (expect 0012)", Result);

        $finish;
    end
endmodule
