`timescale 1ns / 1ps

module tb_LeftShifter;
    reg  [15:0] DataIn;
    wire [15:0] DataOut;

    LeftShifter uut(.DataIn(DataIn), .DataOut(DataOut));

    initial begin
        DataIn = 16'h0001; #10;
        $display("In=0001 -> Out=0x%04h (expect 0002)", DataOut);

        DataIn = 16'h0002; #10;
        $display("In=0002 -> Out=0x%04h (expect 0004)", DataOut);

        DataIn = 16'hFFFF; #10;
        $display("In=FFFF -> Out=0x%04h (expect FFFE)", DataOut);

        DataIn = 16'h8000; #10;
        $display("In=8000 -> Out=0x%04h (expect 0000)", DataOut);

        $finish;
    end
endmodule
