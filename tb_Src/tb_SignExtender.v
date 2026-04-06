`timescale 1ns / 1ps

module tb_SignExtender;
    reg  [3:0]  ImmediateIn;
    wire [15:0] ImmediateOut;

    SignExtender uut(.ImmediateIn(ImmediateIn), .ImmediateOut(ImmediateOut));

    initial begin
        // Positive: 4'b0011 = +3 -> 0x0003
        ImmediateIn = 4'b0011; #10;
        $display("In=0011 -> Out=0x%04h (expect 0003)", ImmediateOut);

        // Negative: 4'b1110 = -2 -> 0xFFFE
        ImmediateIn = 4'b1110; #10;
        $display("In=1110 -> Out=0x%04h (expect FFFE)", ImmediateOut);

        // Negative: 4'b1000 = -8 -> 0xFFF8
        ImmediateIn = 4'b1000; #10;
        $display("In=1000 -> Out=0x%04h (expect FFF8)", ImmediateOut);

        // Zero
        ImmediateIn = 4'b0000; #10;
        $display("In=0000 -> Out=0x%04h (expect 0000)", ImmediateOut);

        $finish;
    end
endmodule
