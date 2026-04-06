`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 10:21:48 PM
// Design Name: 
// Module Name: LeftShifter
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


module LeftShifter(
    input [15:0] DataIn,
    output [15:0] DataOut
    );
    
    reg [15:0] tmp = 16'h0000;
    
    always@ (DataIn)
    begin
        tmp = DataIn << 1;
    end
    
    assign DataOut = tmp;
    
endmodule
