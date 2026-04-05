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
    input [15:0] Data_In,
    output [15:0] Data_Out
    );
    
    reg [15:0] tmp = 16'h0000;
    always@ (Data_In)
    begin
        tmp[15:1] = Data_In[14:0];
        tmp[0] = 1'b0; // setting first bit as 0
    end
    
    assign Data_Out = tmp;
    
endmodule
