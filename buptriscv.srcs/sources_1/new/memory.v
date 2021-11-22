`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/05 15:53:27
// Design Name: 
// Module Name: memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:az
// 
//////////////////////////////////////////////////////////////////////////////////


module memory(
    input clk,
    input rst,
    input [31:0] iaddr,
    output reg [31:0] omem
    );
    if (iaddr & 32'hFFF80000)
    begin
        
    end
endmodule
