`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/05 14:41:20
// Design Name: 
// Module Name: riscv_top
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

module riscv_top(
    input clk,
    input rst
    );
    wire [31:0] imem1, imem2;
    wire [31:0] pcCount;
    wire pcHold, dmemWeEn3, rdEn3, rdEn4, loadEn4, sect1, pcEn3;
    wire [4:0] addrW3, addrW4, rd1, rs11, rs21, rd2, rs12, rs22;
    wire [1:0] loadSel4;
    wire [2:0] frt1, truncS1, trunci11, trunc2;
    wire [3:0] type1, opr1, opi21, opb1, op2, type2;
    wire [31:0] dmemaddr3, data31, data32, pcOut2;
    wire [31:0] pcOut3, dmemout3, dmemin3, dmemout4, aluout2, aluout3, aluout4, dataW4, alua2, alub2, datasrc12, datasrc22, data12, data22;
    
    pcCounter pc(clk, rst, pcHold, pcEn3, pcOut3, pcCount, pcCount);
    imemblock i(.clka(clk), .wea(1'b0), .addra(pcCount), .dina(), .douta(imem1));
    pipelineIF IF(clk, rst, imem1, pcHold, imem2);
    
    // pipelineID
    controlLogic clogic(imem2, rst, clk, frt1, sect1, rd1, rs11, rs21, data31, type1);
    RLogic rlogic(frt1, sect1, opr1);
    I2Logic i2logic(frt1, sect1, opi21);
    SLogic slogic(frt1, truncS1);
    I1Logic i1logic(frt1, trunci11);
    BLogic blogic(frt1, opb1);
    pipelineID(clk, rst, data31, type1, rs11, rs21, rd1, opr1, opi21, opb1, trunci11, truncS1, pcHold, op2, trunc2, type2, data32, rd2, rs12, rs22);
    
    // pipelineIE
    // 
    ALUSrc alusrc(data12, data22, data32, pcCount, type2, alua2, alub2);
    ALUPC alupc(data12, data22, data32, pcCount, type2, pcOut2);
    ALU alu(alua2, alub2, op2, aluout2);
    pipelineIE IE(aluout2, pcOut2, data22, rd2, type2, trunc2, clk, rst, pcOut3, aluout3, dmemin3, dmemaddr3, addrW3, trunc3, pcEn3, rdEn3, loadEn3, dmemWeEn3);
    // pipelineIM
    
    dmem d(clk, rst, dmemWeEn3, dmemaddr3, dmemin3, trunc3, dmemout3);
    pipelineIM IM(clk, rst, dmemout3, aluout3, rdEn3, loadEn3, addrW3, 
                  dmemout4, aluout4, rdEn4, loadEn3, addrW4);
    // pipelineReg
    dataselect dataMux(dmemout4, aluout4, loadEn4, loadSel4, dataW4);
    
    // hazard
    datahazard dataforward(rs12, rs22, addrW3, addrW4, rdEn3, rdEn4, aluout3, dataW4, datasrc12, datasrc22, data12, data22);
    registerMem(rs12, rs22, rd4, clk, rdEn4, dataW4, datasrc12, datasrc22);
    
    pcHolder pcholder(clk, rst, pcEn3, pcHold);
endmodule