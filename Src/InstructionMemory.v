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
    
    reg [7:0] instrmem [0:255];    
    reg [15:0] instruction;
    
    /*initial
    begin
        $readmemh("instructions_memoryfile.mem", instrmem, 16'h0000, 16'h007F);
    end
    */
    integer i;
    initial
    begin
        instrmem[0] = 8'h31;
        instrmem[1] = 8'h11;
        
        instrmem[2] = 8'h32;
        instrmem[3] = 8'h24;
        
        instrmem[4] = 8'h33;
        instrmem[5] = 8'h3A;
        
        instrmem[6] = 8'h01;
        instrmem[7] = 8'h12;
        
        instrmem[8] = 8'h03;
        instrmem[9] = 8'h20;
        
        instrmem[10] = 8'h21;
        instrmem[11] = 8'h00;
        
        instrmem[12] = 8'h02;
        instrmem[13] = 8'h31;
        
        instrmem[14] = 8'h01;
        instrmem[15] = 8'h36;
        
        instrmem[16] = 8'h03;
        instrmem[17] = 8'h23;
        
        instrmem[18] = 8'h12;
        instrmem[19] = 8'h00;
        
        instrmem[20] = 8'h41;
        instrmem[21] = 8'h11;
        
        instrmem[22] = 8'h51;
        instrmem[23] = 8'h20;
        
        instrmem[24] = 8'h60;
        instrmem[25] = 8'h08;
        
        for (i = 26; i < 256; i = i + 1) begin
            instrmem[i] = 8'h00;
        end
        
        instruction = 16'h0000;
    end
    
    always@ (Addr)
    begin
        instruction = { instrmem[Addr[6:0]], instrmem[Addr[6:0] + 1] };
    end
    
    assign Opcode = instruction[15:12];
    assign Rt = instruction[11:8];
    assign Rs = instruction[7:4];
    assign Funct = instruction[3:0];
    assign Immed = instruction[3:0];
    assign JmpOffset = instruction[11:0];
endmodule