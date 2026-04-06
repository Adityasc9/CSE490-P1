`timescale 1ns / 1ps

// NOTE: BranchLogic has an operator precedence bug.
// `BranchCntrl & 2'b01 == ALUFlags` is parsed as `BranchCntrl & (2'b01 == ALUFlags)`
// Expected behaviour: Result=1 when the branch type matches the ALU flag.
module tb_BranchLogic;
    reg  [1:0] BranchCntrl, ALUFlags;
    wire       Result;

    BranchLogic uut(.BranchCntrl(BranchCntrl), .ALUFlags(ALUFlags), .Result(Result));

    initial begin
        // beq (BranchCntrl=10), EQ flag set (ALUFlags=10)  expect Result=1
        BranchCntrl = 2'b10; ALUFlags = 2'b10; #10;
        $display("beq, EQ set: Result=%b (expect 1 )", Result);

        // bne (BranchCntrl=01), NE flag set (ALUFlags=01)  expect Result=1
        BranchCntrl = 2'b01; ALUFlags = 2'b01; #10;
        $display("bne, NE set: Result=%b (expect 1 )", Result);

        // beq (BranchCntrl=10), NE flag set (ALUFlags=01)  expect Result=0
        BranchCntrl = 2'b10; ALUFlags = 2'b01; #10;
        $display("beq, NE set: Result=%b (expect 0)", Result);

        // No branch (BranchCntrl=00)  expect Result=0
        BranchCntrl = 2'b00; ALUFlags = 2'b10; #10;
        $display("no branch:   Result=%b (expect 0)", Result);

        $finish;
    end
endmodule
