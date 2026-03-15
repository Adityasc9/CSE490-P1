`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2026 06:10:33 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input wire[15:0] A,
    input wire[15:0] B,
    input wire[2:0] Operation,
    output wire[15:0] Result,
    output wire[1:0] Flags
    );
    
    reg[15:0] r;
    reg[1:0] f;
    
    localparam EQ = 1;
    localparam NE = 0;
    
    always@ (A,B,Operation)
    begin
        case(Operation)
            3'b000: r = A + B;
            3'b001: r = A - B;
            3'b010: r = A << B;
            3'b011: r = A & B;
            3'b100: r = A >> B;
            3'b101: r = A | B;
            3'b110: r = A ^ B;
            3'b111: r = ~A;
        endcase
        
        if (A == B) begin
            f[EQ] = 1'b1;
        end
        else begin
            f[EQ] = 1'b0;
        end
        
        if (A != B) begin
            f[NE] = 1'b1;
        end
        else begin
            f[NE] = 1'b0;
        end
    end
    
    assign Result = r;
    assign Flags = f;
    
endmodule
