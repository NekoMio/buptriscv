`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/08 19:36:15
// Design Name: 
// Module Name: pipelineIM
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


module pipelineIM(
        input clk, rst,
        input[31:0] dmemout3, aluout3,
        input rdEn3, loadEn3,
        input[4:0] addrW3,
        output reg [31:0] dmemout4, aluout4,
        output reg rdEn4, loadEn4,
        output reg [4:0] addrW4
    );
    always@(posedge clk)
    begin
        dmemout4 <= dmemout3;
        aluout4 <= aluout3;
        rdEn4 <= rdEn3;
        loadEn4 <= loadEn3;
        addrW4 <= addrW3;
    end
	
endmodule
