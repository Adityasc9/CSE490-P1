`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 09:01:05 PM
// Design Name: 
// Module Name: SignExtender
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


module SignExtender(
    input wire[3:0] ImmediateIn,
    output wire[15:0] ImmediateOut
    );
    
    reg [15:0] extended;
    
    always@ (ImmediateIn)
    begin
        extended = {{12{ImmediateIn[3]}}, ImmediateIn[3:0]};
    end
    
    assign ImmediateOut = extended;
    
endmodule
