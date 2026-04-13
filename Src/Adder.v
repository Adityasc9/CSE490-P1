`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 10:21:48 PM
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [15:0] A,
    input [15:0] B,
    output [15:0] Result
    );
    
    reg [15:0] r;
    
    initial
    begin
        r = 16'h0000;
    end
    
    always@ (A, B)
    begin
        r = A + B;
    end
    
    assign Result = r;
    
endmodule