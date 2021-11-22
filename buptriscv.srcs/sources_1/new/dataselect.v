`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/07 16:18:27
// Design Name: 
// Module Name: dataselect
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


module dataselect(
    input [31:0] dmemout_4,
    input [31:0] aluout_4,
    input storeFlag_4,
    input [1:0] loadSel_4,
    output reg[31:0] dataW_4
    );
    always@(*)
    begin
        if (storeFlag_4 == 0)
            dataW_4 <= aluout_4;
        else
            begin
            if (loadSel_4 == 3'b010)
                dataW_4 <= dmemout_4;
            else
                begin
                if (loadSel_4 == 3'b001)
                    dataW_4 <= dmemout_4;
                end
            end
    end
endmodule
