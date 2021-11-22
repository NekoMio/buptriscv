`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/08 15:15:48
// Design Name: 
// Module Name: dmem
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


module dmem(
    input clk,
    input rst,
    input dmemWeEn3,
    input [31:0] dmemaddr3,
    input [31:0] dmemin3,
    input [2:0] trunc3,
    output reg [31:0] dmemout3
    );
    wire clk2, locked;
    reg [7:0] dmemin[3:0];
    reg [7:0] dmemout[3:0];
    reg [17:0] dmemaddr;
    clockgen clock(clk2, rst, locked, clk);
    reg [1:0] tmp;
    reg WeEn;
    initial
    begin
        tmp = 2'b00;
        WeEn <= dmemWeEn3;
        dmemaddr <= dmemaddr3[17:0];
        if (dmemWeEn3 == 1'b1)
        begin
            if (trunc3[1:0] == 2'b01)
                tmp = 2'b11;
            else if (trunc3[1:0] == 2'b10)
                tmp = 2'b10;
        end
        dmemin[0] <= dmemin3[31:24];
        dmemin[1] <= dmemin3[23:16];
        dmemin[2] <= dmemin3[15:8];
        dmemin[3] <= dmemin3[7:0];
    end
    dmemblock dmenb(clk2, WeEn, dmemaddr, dmemin[tmp], dmemout[tmp]);
    always @(posedge clk2)
    begin
        dmemaddr <= dmemaddr + 18'h00000001;
        if (tmp == 2'b11) WeEn <= 1'b0;
        tmp <= tmp + 2'b01;
    end
//    always@(posedge clk2)
//    begin
//        if (dmemWeEn3 == 1'b0)
//        begin
//            tmp = 1'b0;
//        end
//        else
//        begin
//            tmp = 1'b1;
//        end
//    end
    always@(*)
    begin
        if (trunc3[1:0] == 2'b11)
            dmemout3 <= {dmemout[0], dmemout[1], dmemout[2], dmemout[3]};
        else if (trunc3 == 3'b001)
            dmemout3 <= {{24{1'b0}}, dmemout[3]};
        else if (trunc3 == 3'b101)
        begin
            if (dmemout[3][7] == 1'b0)
                dmemout3 <= {{24{1'b0}}, dmemout[3]};
            else
                dmemout3 <= {{24{1'b1}}, dmemout[3]};
        end
        else if (trunc3 == 3'b010)
            dmemout3 <= {{15{1'b0}}, dmemout[2], dmemout[3]};
        else if (trunc3 == 3'b110)
        begin
            if (dmemout[2][7] == 1'b0)
                dmemout3 <= {{15{1'b0}}, dmemout[2], dmemout[3]};
            else
                dmemout3 <= {{15{1'b1}}, dmemout[2], dmemout[3]};
        end
    end
//    dmemblock dmenb(clk2, )
endmodule
