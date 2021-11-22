module controlLogic(
							input [31:0] OPCode_1,
                            input reset,
                            input clk,
                            output [2:0] frt_1,
                            output sect_1,
                            output [4:0] rd_1,
                            output [4:0] rs1_1,
                            output [4:0] rs2_1,
                            output reg [31:0] data3_1,
                            output reg [3:0] type_1);

    assign rd_1 = OPCode_1[11:7];
    assign frt_1 = OPCode_1[14:12];
    assign sect_1 = OPCode_1[30];
    assign rs1_1 = OPCode_1[19:15];
    assign rs2_1 = OPCode_1[24:20];
    parameter A1 = 32'hFFFFFFFF;
    parameter A0 = 32'h00000000;

    always@(*) 
    begin
        case (OPCode_1[6:0])
            7'b0110111: // U lui
                begin
                    type_1 = 4'b0110;
                    data3_1 = {OPCode_1[31:12],A0[11:0]}; 
                end
            7'b0010111: // U auipc
                begin
                    type_1 = 4'b0111;
                    data3_1 = {OPCode_1[31:12],A0[11:0]};
                end
            7'b1101111: // J jal
                begin
                    type_1 = 4'b1000;
                    if(OPCode_1[31] == 1'b1) data3_1={A1[11:0],OPCode_1[31:12]};
                    else data3_1={A0[11:0],OPCode_1[31:12]};
                end
            7'b1100111: // I jalr
                begin
                    type_1 = 4'b1001;
                    if(OPCode_1[31] == 1'b1) data3_1={A1[19:0],OPCode_1[31:20]};
                    else data3_1={A0[19:0],OPCode_1[31:20]};
                end
            7'b0110011: // R ~
                type_1 = 4'b0001;
            7'b0010011: // I2 ~
                begin
                    type_1 = 4'b0010;
                    if(OPCode_1[14:12] == 3'b001 || OPCode_1[14:12] == 3'b101) data3_1={A0[26:0],OPCode_1[24:20]};
                    else if(OPCode_1[31] == 1'b1) data3_1={A1[19:0],OPCode_1[31:20]};
                    else data3_1={A0[19:0],OPCode_1[31:20]};
                end
            7'b0100011: // S ~
                begin
                    type_1 = 4'b0011;
                    if(OPCode_1[31] == 1'b1) data3_1={A1[19:0],OPCode_1[31:25],OPCode_1[11:7]};
                    else data3_1={A0[19:0],OPCode_1[31:25],OPCode_1[11:7]};
                end
            7'b0000011: // I1 ~
                begin
                    type_1 = 4'b0100;
                    if(OPCode_1[31] == 1'b1) data3_1={A1[19:0],OPCode_1[31:20]};
                    else data3_1={A0[19:0],OPCode_1[31:20]};
                end
            7'b1100011: // B ~
                begin
                    type_1 = 4'b0101;
                    if(OPCode_1[31] == 1'b1) data3_1={A1[19:0],OPCode_1[31:25],OPCode_1[11:7]};
                    else data3_1={A1[19:0],OPCode_1[31:25],OPCode_1[11:7]};
                end
            default:
                type_1 = 4'b0000;
        endcase
    end

endmodule

module RLogic (
							input [2:0] frt_1,
                            input sect_1,
                            output reg [3:0] op_1
);

    always@(*)
    begin
        case(frt_1)
            3'b000:
                begin
                    if(sect_1 == 0'b1) op_1=4'b0000;
                    else op_1=4'b0001;
                end
            3'b001:
                op_1=4'b0111;
            3'b010:
                op_1=4'b1000;
            3'b011:
                op_1=4'b1010;
            3'b100:
                op_1=4'b0100;
            3'b101:
                begin
                    if(sect_1 == 0'b1) op_1=4'b0101;
                    else op_1=4'b0110;
                end
            3'b110:
                op_1=4'b0010;
            3'b111:
                op_1=4'b0011;
        endcase
    end

endmodule

module I2Logic (
							input [2:0] frt_1,
                            input sect_1,
                            output reg [3:0] op_1
);

    always@(*)
    begin
        case(frt_1)
            3'b000:
                op_1=4'b0000;
            3'b001:
                op_1=4'b0111;
            3'b010:
                op_1=4'b1000;
            3'b011:
                op_1=4'b1010;
            3'b100:
                op_1=4'b0100;
            3'b101:
                begin
                    if(sect_1 == 0'b1) op_1=4'b0101;
                    else op_1=4'b0110;
                end
            3'b110:
                op_1=4'b0010;
            3'b111:
                op_1=4'b0011;
        endcase
    end

endmodule

module SLogic (
							input [2:0] frt_1,
							output reg [2:0] trunc_1
);
    
    always@(*)
    begin
        case(frt_1)
            3'b000:
                trunc_1=3'b001;
            3'b001:
                trunc_1=3'b010;
            3'b010:
                trunc_1=3'b011;
        endcase
    end

endmodule

module I1Logic (
							input [2:0] frt_1,
							output reg [2:0] trunc_1
);
    
    always@(*)
    begin
        case(frt_1)
            3'b000:
                trunc_1=3'b101;
            3'b001:
                trunc_1=3'b110;
            3'b010:
                trunc_1=3'b111;
            3'b100:
                trunc_1=3'b001;
            3'b101:
                trunc_1=3'b010;
            
        endcase
    end

endmodule

module BLogic (
							input [2:0] frt_1,
                            output reg[3:0] op_1
);

    always@(*)
    begin
        case(frt_1)
            3'b000:
                op_1=4'b1100;
            3'b001:
                op_1=4'b1101;
            3'b100:
                op_1=4'b1000;
            3'b101:
                op_1=4'b1001;
            3'b110:
                op_1=4'b1010;
            3'b111:
                op_1=4'b1011;
        endcase
    end
    
endmodule


module pipelineID(
                            input clk, reset,
							input [31:0] data3_1,
                            input [3:0] type_1,
                            input [4:0] rs1_1,
                            input [4:0] rs2_1,
                            input [4:0] rd_1,
                            input [3:0] opr,
                            input [3:0] opi,
                            input [3:0] opb,
                            input [2:0] trunci,
                            input [2:0] truncs,
                            input pchold,
                            output reg[3:0] op_2,
                            output reg[2:0] trunc_2,
                            output reg[3:0] type_2,
                            output reg[31:0] data3_2,
                            output reg[4:0] rd_2,
                            output reg[4:0] rs1_2,
                            output reg[4:0] rs2_2
    );

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            type_2 <= 4'b0000;
        else
        begin 
        rs1_2 <= rs1_1;
        rs2_2 <= rs2_1;
        data3_2 <= data3_1;
        rd_2 <= rd_1;
        if(pchold == 1'b1)
            begin
                type_2 = 4'b0000;
            end
        else
            begin
                case(type_1)
                    4'b0110:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = 3'b000; 
                        end
                    4'b0111:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = 3'b000; 
                        end  
                    4'b1000:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = 3'b000; 
                        end
                    4'b1001:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = 3'b000; 
                        end
                    4'b0001:
                        begin
                            type_2 = type_1;
                            op_2 = opr;
                            trunc_2 = 3'b000; 
                        end
                    4'b0010:
                        begin
                            type_2 = type_1;
                            op_2 = opi;
                            trunc_2 = 3'b000; 
                        end
                    4'b0011:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = truncs;
                        end
                    4'b0100:
                        begin
                            type_2 = type_1;
                            op_2 = 4'b0000;
                            trunc_2 = trunci;
                        end
                    4'b0101:
                        begin
                            type_2 = type_1;
                            op_2 = opb;
                            trunc_2 = 3'b000;
                        end
                endcase
            end
         end
    end

endmodule


module registerMem(
						    input[4:0] addrA, input[4:0]addrB, input[4:0]addrW,
						    input clk, input writeEn, 
                            input[31:0] dataW,
                            // input ebk, input ret,
						    output[31:0] A,output[31:0] B);
						 
	reg[2:0] tp;
	reg[31:0] registers[7:0][31:0];
	assign A = registers[tp][addrA];
	assign B = registers[tp][addrB];

//	initial
//        begin
//            for(reg[2:0] i=0;i<8;i+) registers[i*32] = 32'h00000000;
//            tp = 3'b000;
//        end
	always @(negedge clk)
	begin
	   registers[tp][5'b0] <= 31'b0;
		if(writeEn == 1 && addrW != 5'b00000) registers[tp][addrW] <= dataW;
    end

//    always @(posedge clk)
//    begin
//        if(ebk == 1) tp = tp + 3'b001;
//        else if(ret == 1) tp = tp - 3'b001;
//    end
    
endmodule