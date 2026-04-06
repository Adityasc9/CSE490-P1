`timescale 1ns / 1ps

module tb_MUX2to1;
    reg  [15:0] A, B;
    reg         Select;
    wire [15:0] Out;

    MUX2to1 uut(.A(A), .B(B), .Select(Select), .Out(Out));

    initial begin
        A = 16'hAAAA; B = 16'h5555;

        Select = 0; #10;
        $display("Select=0: Out=0x%04h (expect AAAA)", Out);

        Select = 1; #10;
        $display("Select=1: Out=0x%04h (expect 5555)", Out);

        $finish;
    end
endmodule
