`timescale 1ns/10ps
module forwarding (EXMEMregwrite, MEMWBregwrite, IDEXrm, IDEXrn, EXMEMrd, MEMWBrd, ForwardA, ForwardB);

	output logic [1:0] ForwardA, ForwardB = 2'b0;
	input logic [4:0] IDEXrm, IDEXrn, EXMEMrd, MEMWBrd;
	input logic MEMWBregwrite, EXMEMregwrite;
	
	always begin
		//compare EX/MEM pipeline Rd with ID/EX pipeline Rn first
		if (EXMEMregwrite && (EXMEMrd != 5'd31) && (EXMEMrd == IDEXrn)) begin
			ForwardA = 2'b10; //prior ALU result from MEM stage is input 3 into muxes
		end
		
		//otherwise, compare MEM/WB pipeline Rd with ID/EX pipeline Rn first
		else if (MEMWBregwrite && (MEMWBrd != 5'd31) && (MEMWBrd == IDEXrn)) begin
			ForwardA = 2'b01; //writeBack result is input 2 into muxes
		end
		
		else begin
			ForwardA = 2'b0;
		end
		
		//compare EX/MEM pipeline Rd with ID/EX pipeline Rm 
		if (EXMEMregwrite && (EXMEMrd != 5'd31) && (EXMEMrd == IDEXrm)) begin
			ForwardB = 2'b10;
		end
		
		//otherwise, compare MEM/WB pipeline Rd with ID/EX pipeline Rm
		else if (MEMWBregwrite && (MEMWBrd != 5'd31) && (MEMWBrd == IDEXrm)) begin
			ForwardB = 2'b01;
		end
		
		else begin
			ForwardB = 2'b0;
		end
		
		
	end

endmodule 

//ForwardA, ForwardB new ALUIN1, ALUIN2