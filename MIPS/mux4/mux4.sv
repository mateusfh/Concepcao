module mux4(input logic d0, d1, d2, d3,
			input logic s0, s1,
			output logic y);

	logic y0, y1;
	
	mux2 dut1(.d0(d0), .d1(d1), .s(s0), .y(y0));
	
	mux2 dut2(.d0(d2), .d1(d3), .s(s0), .y(y1));
	
	mux2 dut3(.d0(y0), .d1(y1), .s(s1), .y(y));

endmodule