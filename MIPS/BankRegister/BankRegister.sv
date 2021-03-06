module BankRegister(input logic [4:0] a,
					input logic clk, reset, rw, 
					input logic [4:0] ra1, ra2,
					output logic regDataA, regDataB);

	logic [31:0] dataOut, d;

	decoder decofica(a, d);

	flopenr #(32) regFile(.clk(clk), .reset(reset), .en(rw), .d(d), .q(dataOut));
	
	mux2 #(32) muxinho1(.d0(dataOut[15:0]), .d1(dataOut[31:15]), .s(ra1), .y(regDataA));
	
	mux2 #(32) muxinho2(.d0(dataOut[15:0]), .d1(dataOut[31:15]), .s(ra2), .y(regDataB));
	

endmodule
