`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 06:10:33 PM
// Design Name: 
// Module Name: MUX2to1
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


module MUX2to1(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire Select,
    output wire[15:0] Out
    );
    
    reg[15:0] data_out;
    
    initial
    begin
        data_out = 16'h0000;
    end
    
    always@(A,B,Select)
    begin
        case(Select)
            1'b0: data_out = A;
            1'b1: data_out = B;
        endcase
    end
    
    assign Out = data_out;
endmodule