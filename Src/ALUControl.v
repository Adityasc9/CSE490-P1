`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 09:01:05 PM
// Design Name: 
// Module Name: ALUControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUControl(
    input wire [1:0] ALUOp,
    input wire [3:0] Funct,
    output wire [2:0] Operation
    );
    
    reg [2:0] op;
    initial
    begin
        op = 3'b000;
    end
    
    always@ (ALUOp, Funct)
    begin
        case(ALUOp)
            2'b00: op = 3'b000;     // lw, sw, addi need ALU to add
            2'b01: op = 3'b001;     // beq, bne need ALU to subtract
            2'b10: op = Funct[2:0]; // R-type can use funct field
            default: op = 3'b000;   // Don't care
        endcase
    end
    
    assign Operation = op;
  
endmodule
