`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 07:36:13 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input wire[15:0] Addr,
    output wire[3:0] Opcode,
    output wire[3:0] Rs,
    output wire[3:0] Rt,
    output wire[3:0] Funct,
    output wire[3:0] Immed,
    output wire[11:0] JmpOffset
    );
    
    reg [15:0] instrmem [0:127];    
    reg [15:0] instruction;
    
    initial
    begin
        $readmemh("instructions_memoryfile.mem", instrmem, 16'h0000, 16'h007F);
    end
    
    always@ (Addr)
    begin
        instruction = instrmem[Addr[6:0]];
    end
    
    assign Opcode = instruction[15:12];
    assign Rt = instruction[11:8];
    assign Rs = instruction[7:4];
    assign Funct = instruction[3:0];
    assign Immed = instruction[3:0];
    assign JmpOffset = instruction[11:0];
endmodule
