`timescale 1ns / 1ps

module tb_ALU;
    reg  [15:0] A, B;
    reg  [2:0]  Operation;
    wire [15:0] Result;
    wire [1:0]  Flags;

    ALU uut(.A(A), .B(B), .Operation(Operation), .Result(Result), .Flags(Flags));

    initial begin
        // ADD: 3 + 5 = 8
        A = 16'd3; B = 16'd5; Operation = 3'b000; #10;
        $display("ADD  3+5=%0d (expect 8), Flags=%b", Result, Flags);

        // SUB: 10 - 3 = 7
        A = 16'd10; B = 16'd3; Operation = 3'b001; #10;
        $display("SUB  10-3=%0d (expect 7), Flags=%b", Result, Flags);

        // SLL: 0x005A << 4 = 0x05A0  (B<<A per module: A=4, B=0x005A)
        A = 16'd4; B = 16'h005A; Operation = 3'b010; #10;
        $display("SLL  0x005A<<4=0x%04h (expect 05A0), Flags=%b", Result, Flags);

        // AND: 0x000A & 0x000C = 0x0008
        A = 16'h000A; B = 16'h000C; Operation = 3'b011; #10;
        $display("AND  0x000A&0x000C=0x%04h (expect 0008), Flags=%b", Result, Flags);        
        
        // SLR: 0x0D20 >> 6 = 0x0034
        A = 16'h0006; B = 16'h0D20; Operation = 3'b100; #10;
        $display("SLR  0x0D20>>0x0006=0x%04h (expect 0034), Flags=%b", Result, Flags);
        
         // ORR: 0x0F00 | 0x000F = 0x0F0F
        A = 16'h0F00; B = 16'h000F; Operation = 3'b101; #10;
        $display("ORR  0x0F00|0x000F=0x%04h (expect 0F0F), Flags=%b", Result, Flags);
        
        // XOR: 0x1234 ^ 0x1B38 = 0x090C
        A = 16'h1234; B = 16'h1B38; Operation = 3'b110; #10;
        $display("XOR  0x1234^0x1B38=0x%04h (expect 090C), Flags=%b", Result, Flags);
        
        // NOT: ~0xFEDC = 0x0123
        A = 16'hFEDC; B = 16'h0000; Operation = 3'b111; #10;
        $display("NOT  ~0xFEDC=0x%04h (expect 0123), Flags=%b", Result, Flags);

        // EQ flag: A == B
        A = 16'd7; B = 16'd7; Operation = 3'b000; #10;
        $display("EQ   A==B Flags=%b (expect EQ=1,NE=0 -> Flags=10)", Flags);

        // NE flag: A != B
        A = 16'd7; B = 16'd8; Operation = 3'b001; #10;
        $display("NE   A!=B Flags=%b (expect EQ=0,NE=1 -> Flags=01)", Flags);

        $finish;
    end
endmodule
