`timescale 1ns / 1ps

// RegisterFile testbench — updated for fixed module with WriteReg port
module tb_RegisterFile;
    reg        Clock;
    reg  [3:0] ReadReg1, ReadReg2;
    reg [15:0] WriteData;
    reg        Cntrl_RegWrite;
    wire [15:0] RegData1, RegData2;

    RegisterFile uut(
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2),
        .WriteData(WriteData), .Cntrl_RegWrite(Cntrl_RegWrite),
        .Clock(Clock), .RegData1(RegData1), .RegData2(RegData2)
    );

    always #5 Clock = ~Clock;

    initial begin
        Clock = 1; Cntrl_RegWrite = 0;
        ReadReg1 = 4'd2; ReadReg2 = 4'd3;
        WriteData = 16'hABCD;

        // Write 0xABCD to reg 2
        @(posedge Clock); #1;
        Cntrl_RegWrite = 1;
        @(posedge Clock); #1;
        Cntrl_RegWrite = 0;

        // Read back reg 2 and reg 3 (should still be 0)
        #10;
        $display("RegData1 (reg2) = 0x%04h (expect ABCD)", RegData1);
        $display("RegData2 (reg3) = 0x%04h (expect 0000)", RegData2);

        // Write 0x1234 to reg 2, read back both
        WriteData = 16'h1234;
        @(posedge Clock); #1;
        Cntrl_RegWrite = 1;
        @(posedge Clock); #1;
        Cntrl_RegWrite = 0; #1;
        $display("RegData1 (reg2) = 0x%04h (expect 1234)", RegData1);
        $display("RegData2 (reg3) = 0x%04h (expect 0000)", RegData2);

        $finish;
    end
endmodule
