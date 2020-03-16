module mux2(input logic d0, d1, s,
			output logic y);

	assign y = s ? d1 : d0;

endmodule