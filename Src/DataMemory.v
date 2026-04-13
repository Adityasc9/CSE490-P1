`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 07:36:13 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input wire[15:0] Addr,
    input wire[15:0] DataIn,
    input wire MemRead,
    input wire MemWrite,
    input wire Clock,
    output wire[15:0] DataOut
    );
    
    reg[7:0] datamem [0:255]; 
    integer i;
    
    reg [7:0] a;
    reg [15:0] dout;
    
    initial
    begin
        for (i = 0; i < 256; i = i + 1) begin
            datamem[i] = 8'h00;
        end
        a = 8'h00;
        dout = 16'h0000;
    end
    
    always@ (posedge Clock)
    begin
        a = Addr[7:0];
        
        if (MemRead == 1) begin
            dout = { datamem[a], datamem[a + 1] };
        end        
        else if (MemWrite == 1) begin
            datamem[a] = DataIn[15:8];
            datamem[a + 1] = DataIn[7:0];
        end  
        else ;     
    end
    
    assign DataOut = dout;
endmodule