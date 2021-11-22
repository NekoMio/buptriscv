`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/05 14:54:10
// Design Name: 
// Module Name: pcCounter
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


module pcCounter(
    input clk,
    input rst,
    input pcHold,
    input pcEn3,
    input [31:0] pcOut3,
    input [31:0] prepcCount,
    output reg[31:0] nxtpcCount
    );
    always@(posedge clk or posedge rst)
    begin
        if (rst == 1'b1)
            nxtpcCount <= 31'b0;
        else if (pcHold == 1'b1)
            nxtpcCount <= prepcCount;
        else if (pcEn3 == 1'b1)
            nxtpcCount <= pcOut3;
        else
            nxtpcCount <= prepcCount + 31'b1;
    end
endmodule

module pcHolder(input clk, input rst, input pcEn3, output reg pcHold);
    reg [1:0]tmp;
    initial
    begin
        tmp = 2'b0;
    end
    always@(posedge clk or posedge rst)
    begin
        if (rst == 1'b1)
            pcHold <= 1'b0;
        else if (pcEn3 == 1'b1)
        begin
            tmp <= 2'b0;
            pcHold <= 1'b1;
        end
        else
            tmp <= tmp + 2'b01;
        if (tmp == 2'b10)
            pcHold <= 1'b0;
    end
endmodule