`timescale 1ns / 1ps

module tb_Adder;
    reg  [15:0] A, B;
    wire [15:0] Result;

    Adder uut(.A(A), .B(B), .Result(Result));

    initial begin
        A = 16'h000E; B = 16'h0002; #10;
        $display("0x000E + 0x0002 = 0x%04h (expect 0010)", Result);

        A = 16'hFFFE; B = 16'h0002; #10;
        $display("0xFFFE + 0x0002 = 0x%04h (expect 0000, wraps because overflow)", Result);

        A = 16'h0000; B = 16'h0000; #10;
        $display("0x0000 + 0x0000 = 0x%04h (expect 0000)", Result);
        
        A = 16'hDE00; B = 16'h00AD; #10;
        $display("0xDE00 + 0x00AD = 0x%04h(expect DEAD)", Result);
        
        A = 16'h468A; B = 16'h7865; #10;
        $display("0x468A + 0x7865 = 0x%04h(expect BEEF)", Result);

        $finish;
    end
endmodule