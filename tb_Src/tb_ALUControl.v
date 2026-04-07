`timescale 1ns / 1ps

module tb_ALUControl;
    reg  [1:0] ALUOp;
    reg  [3:0] Funct;
    wire [2:0] Operation;

    ALUControl uut(.ALUOp(ALUOp), .Funct(Funct), .Operation(Operation));

    initial begin
        // lw/sw/addi : ADD (000)
        ALUOp = 2'b00; Funct = 4'bxxxx; #10;
        $display("ALUOp=00 : Op=%b (expect 000)", Operation);

        // beq/bne : SUB (001)
        ALUOp = 2'b01; Funct = 4'bxxxx; #10;
        $display("ALUOp=01 : Op=%b (expect 001)", Operation);

        // R-type add (funct=0000) : 000
        ALUOp = 2'b10; Funct = 4'b0000; #10;
        $display("R-add funct=0000 : Op=%b (expect 000)", Operation);

        // R-type sub (funct=0001) : 001
        ALUOp = 2'b10; Funct = 4'b0001; #10;
        $display("R-sub funct=0001 : Op=%b (expect 001)", Operation);

        // R-type sll (funct=0010) : 010
        ALUOp = 2'b10; Funct = 4'b0010; #10;
        $display("R-sll funct=0010 : Op=%b (expect 010)", Operation);

        // R-type and (funct=0011) : 011
        ALUOp = 2'b10; Funct = 4'b0011; #10;
        $display("R-and funct=0011 : Op=%b (expect 011)", Operation);

        $finish;
    end
endmodule
