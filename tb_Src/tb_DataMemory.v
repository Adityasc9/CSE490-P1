`timescale 1ns / 1ps

module tb_DataMemory;
    reg  [15:0] Addr, DataIn;
    reg         MemRead, MemWrite;
    wire [15:0] DataOut;

    DataMemory uut(.Addr(Addr), .DataIn(DataIn), .MemRead(MemRead), .MemWrite(MemWrite), .DataOut(DataOut));

    initial begin
        MemRead = 0; MemWrite = 0;

        // Write 0x1234 to address 0x0010 
        Addr = 16'h0010; DataIn = 16'h1234; MemWrite = 1; MemRead = 0; #10;
        MemWrite = 0; #5;

        // Read back from same address
        Addr = 16'h0010; MemRead = 1; #10;
        $display("Read 0x%04h (expect 1234)", DataOut);
        MemRead = 0; #5;

        // Write 0xBEEF to address 0x0020
        Addr = 16'h0020; DataIn = 16'hBEEF; MemWrite = 1; #10;
        MemWrite = 0; #5;

        Addr = 16'h0020; MemRead = 1; #10;
        $display("Read 0x%04h (expect BEEF)", DataOut);
        MemRead = 0;

        $finish;
    end
endmodule
