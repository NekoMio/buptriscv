`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/05 15:17:08
// Design Name: 
// Module Name: pipelineIF
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


module pipelineIF(
    input clk,
    input rst,
    input [31:0] imem_0,
    input pcHold,
    output reg [31:0] imem_1
    );
    always@(posedge clk or posedge rst)
    begin
        if (rst == 1'b1)
            imem_1 <= 32'b0;
        else if (pcHold)
            imem_1 <= imem_1;
        else
            imem_1 <= imem_0;
    end
endmodule
