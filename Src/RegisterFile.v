`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 07:36:13 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input wire[3:0] ReadReg1,
    input wire[3:0] ReadReg2,
    input wire[15:0] WriteData,
    input wire Cntrl_RegWrite,
    input wire Clock,
    output wire[15:0] RegData1,
    output wire[15:0] RegData2
    );
    
    reg [15:0] regfile [0:15];
    integer i;
    
    reg [15:0] regdata1;
    reg [15:0] regdata2;
    
    initial
    begin
        for (i = 0; i < 16; i = i + 1) begin
            regfile[i] = 16'h0000;
        end
        regdata1 = 16'h0000;
        regdata2 = 16'h0000;
    end
    
    always@ (Clock)
    begin
        if (!Clock) begin
            regdata1 = regfile[ReadReg1];
            regdata2 = regfile[ReadReg2];
        end
        else if (Clock & Cntrl_RegWrite) begin
            regfile[ReadReg1] = WriteData;
        end  
        else ;       
    end
    
    assign RegData1 = regdata1;
    assign RegData2 = regdata2;
    
endmodule