module ALUSrc(
					input[31:0] data1_2, data2_2, data3_2, pcReg,
					input[3:0] type_2,
					output reg[31:0] ALUA, ALUB);

	always @ (*)
	begin
		case(type_2)
			4'b0000: // do nothing
			begin
			end
			4'b0001:
			begin
				ALUA <= data1_2;
				ALUB <= data2_2;
			end
			4'b0010:
			begin
				ALUA <= data1_2;
				ALUB <= data3_2;
			end
			4'b0011:
			begin
				ALUA <= data1_2;
				ALUB <= data3_2;
			end
			4'b0100:
			begin
				ALUA <= data1_2;
				ALUB <= data3_2;
			end
			4'b0101:
			begin
				ALUA <= data1_2;
				ALUB <= data2_2;
			end
			4'b0110:
			begin
				ALUA <= 32'h00000000;
				ALUB <= data3_2;
			end
			4'b0111:
			begin
				ALUA <= pcReg;
				ALUB <= data3_2;
			end
			4'b1000:
			begin
				ALUA <= pcReg;
				ALUB <= 32'h00000004;
			end
			4'b1001:
			begin
				ALUA <= pcReg;
				ALUB <= 32'h00000004;
			end
		endcase
	end
					
endmodule

module ALUPC(
				input[31:0] data1_2, data2_2, data3_2, pcReg,
				input[3:0] type_2,
				output reg[31:0] pcOut);

	always @ (*)
	begin
		if(type_2 == 4'b0101 || type_2 == 4'b1000)
			pcOut = pcReg + data3_2;
		else if(type_2 == 4'b1001)
			pcOut = (data1_2 + data3_2) & (~(32'h00000001));
		else
			pcOut = 32'hFFFFFFFF;
	end
endmodule

module ALU (
				input[31:0] A, B,
				input[3:0] aluOp,
				output reg[31:0] aluOut);
			
	always @ (*)
	begin
		case(aluOp)
			4'b0000: // +
				aluOut = A + B;
			4'b0001: // -
				aluOut = A - B;
			4'b0010: // or
				aluOut = A | B;
			4'b0011: // and
				aluOut = A & B;
			4'b0100: // xor
				aluOut = A ^ B;
			4'b0101: // SRL
				aluOut = A >> B;
			4'b0110: // SRA
				aluOut = {A[7], A[7:1]};
			4'b0111: // SRL
				aluOut = A << B;
			4'b1000:// SL
				begin
					if($signed(A) < $signed(B))
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
			4'b1001:// SGE
				begin
					if($signed(A) >= $signed(B))
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
			4'b1010: // UL
				begin
					if(A < B)
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
			4'b1011: // UGE
				begin
					if(A >= B)
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
			4'b1100: // EQ
				begin
					if(A == B)
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
			4'b1101: // NEQ
				begin
					if(A != B)
						aluOut = 32'h00000001 ;
					else
						aluOut = 32'h00000000 ;
				end
		endcase
    end
endmodule

module pipelineIE(
						input[31:0] aluOut, pcOut, data2_2,
						input[4:0] rdAddr_2,
						input[3:0] type_2,
						input[2:0] trunc_2,
						input clk, rst, 
						output reg[31:0] pcData_3, rdData_3, memData_3,
						output reg[31:0] memAddr_3,
						output reg[4:0] rdAddr_3,
						output reg[2:0] trunc_3,
						output reg pcEn_3, rdEn_3, loadEn_3, memEn_3);
	
	always@(posedge clk or posedge rst)
	begin
	if(rst == 1'b1)
		begin
			pcData_3 <= 32'h00000000;
			rdData_3 <= 32'h00000000;
			memData_3 <= 32'h00000000;
			memAddr_3 <= 32'h00000000;
			rdAddr_3 <= 5'b00000;
			trunc_3 <= 2'b00;
			pcEn_3 <= 1'b0;
			rdEn_3 <= 1'b0;
			loadEn_3 <= 1'b0;
			memEn_3 <= 1'b0;
		end
	else
		begin
			pcData_3 <= pcOut;
			rdData_3 <= aluOut;
			memData_3 <= data2_2;
			
			if(type_2 == 4'b0011 || type_2 == 4'b0100)
				memAddr_3 <= aluOut;
			else
				memAddr_3 <= 32'h00000000;
			
			rdAddr_3 <= rdAddr_2;
			trunc_3 <= trunc_2;

			if(type_2 == 4'b0101 || type_2 == 4'b1000 || type_2 == 4'b1001)
				pcEn_3 <= 1'b1;
			else
				pcEn_3 <= 1'b0;
			
			if(type_2 == 4'b0001 || type_2 == 4'b0010 || type_2 == 4'b0100 || type_2 == 4'b0110 || type_2 == 4'b0111 || type_2 == 4'b1000 || type_2 == 4'b1001)
				rdEn_3 <= 1'b1;
			else
				rdEn_3 <= 1'b0;
			
			if(type_2 == 4'b0100)
				loadEn_3 <= 1'b1;
			else
				loadEn_3 <= 1'b0;
			
			if(type_2 == 4'b0011)
				memEn_3 <= 1'b1;
			else
			begin
				memEn_3 <= 1'b0;
			end
		end
	end
						
endmodule