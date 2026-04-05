`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 06:10:33 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk,
    input wire[15:0] NextAddr,
    output wire[15:0] CurrAddr
    );
    
    reg[15:0] address;

    
    initial
    begin
        address = 16'h0000;
    end
    
    always@ (posedge clk)
    begin
        address <= NextAddr;
    end
    
    assign CurrAddr = curr;

endmodule
