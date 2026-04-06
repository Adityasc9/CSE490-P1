`timescale 1ns / 1ps

module tb_PC;
    reg        Clock;
    reg  [15:0] NextAddr;
    wire [15:0] CurrAddr;

    PC uut(.NextAddr(NextAddr), .Clock(Clock), .CurrAddr(CurrAddr));

    always #5 Clock = ~Clock;

    initial begin
        Clock = 1; NextAddr = 16'h0002; #10;
        $display("After reset:  CurrAddr=%04h (expect 0000)", CurrAddr);

        NextAddr = 16'h0004;
        @(posedge Clock); #10;
        $display("After +2:     CurrAddr=%04h (expect 0002)", CurrAddr);

        NextAddr = 16'h0006;
        @(posedge Clock); #10;
        $display("After +4:     CurrAddr=%04h (expect 0004)", CurrAddr);

        NextAddr = 16'h0008;
        @(posedge Clock); #10;
        $display("After +6:     CurrAddr=%04h (expect 0006)", CurrAddr);

        $finish;
    end
endmodule
