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
    
    reg[15:0] address;
    reg[15:0] curr;
    initial

    begin
        address = 16'h0000;
    end
    
    always@ (posedge Clock)
    begin
        curr = address;
        address = NextAddr;
    end
    
    assign CurrAddr = curr;

endmodule
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
    output wire[15:0] CurrAddr
    );
    
    reg[15:0] address;
    reg[15:0] curr;
    
    initial
    begin
        address = 16'h0000;
    end
    
    always@ (NextAddr)
    begin
        curr = address;
        address = NextAddr;
    end
    
    assign CurrAddr = curr;

endmodule
