`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 10:29:47 PM
// Design Name: 
// Module Name: BranchLogic
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


module BranchLogic(
    input wire[1:0] BranchCntrl,
    input wire[1:0] ALUFlags,
    output wire Result
    );
    
    reg r;
    initial
    begin
        r = 1'b0;
    end
    
    always@ (BranchCntrl, ALUFlags)
    begin
        if ((BranchCntrl === 2'b01) && (ALUFlags === 2'b01))
            r = 1'b1;
        else if ((BranchCntrl === 2'b10) && (ALUFlags === 2'b10))
            r = 1'b1;
        else 
            r = 1'b0;
    end
    
    assign Result = r;
    
endmodule