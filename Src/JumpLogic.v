`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 11:17:31 PM
// Design Name: 
// Module Name: JumpLogic
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


module JumpLogic(
    input [15:0] PC,
    input [15:0] Offset,
    output [15:0] Result
    );
    
    reg [15:0] jmp_addr;
    
    initial
    begin
        jmp_addr = 16'h0000;
    end
    
    always@ (PC, Offset)
    begin
        jmp_addr = PC + Offset;
    end
    
    assign Result = jmp_addr;

endmodule