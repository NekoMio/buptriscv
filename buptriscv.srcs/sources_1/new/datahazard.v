`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/07 19:26:08
// Design Name: 
// Module Name: datahazard
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


module datahazard(
    input [4:0]rsaddr1_2,
    input [4:0]rsaddr2_2,
    input [4:0]addrW_3,
    input [4:0]addrW_4,
    input rdEn_3, input rdEn_4,
    input [31:0] dataW_3, input[31:0] dataW_4,
    input [31:0]rs1_2, input [31:0] rs2_2,
    output reg [31:0] data1_2, output reg [31:0] data2_2
    );
    always@(*)
        begin
        data1_2 <= rs1_2;
        data2_2 <= rs2_2;
        if (rdEn_3 == 1'b1)
        begin
            if (rsaddr1_2 == addrW_3)
                data1_2 <= dataW_3;
            else if (rsaddr2_2 == addrW_3)
                data2_2 <= dataW_3;
        end
        else if (rdEn_4 == 1'b1)
        begin
            if (rsaddr1_2 == addrW_4)
                data1_2 <= dataW_4;
            else if (rsaddr2_2 == addrW_4)
                data2_2 <= dataW_4;
        end
    end
endmodule
