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
    input wire[15:0] NextAddr,
    input wire Clock,
    output wire[15:0] CurrAddr
    );
    
    reg[15:0] pc_reg;
    initial

    begin
        pc_reg = 16'h0000;
    end
    
    always@ (posedge Clock)
    begin
        pc_reg <= NextAddr;
    end
    
    assign CurrAddr = pc_reg;

endmodule
