module addac(input logic a, sel0, sel1,clk, acc,
			 output logic y, cout);
			 
	logic notA, mux0, mux1, sum, accout;
	
	inv inversor(a, notA);
	
	mux2 m1(a, notA, sel0, mux0);
	
	somador somador( mux0, acc, sel0, cout, sum);
	
	mux2 m2(mux0, sum, sel1, mux1);
	
	flopenr dut(clk, 1'b0, 1'b1, mux1, accout);
	
	assign y = mux1;
	 
 
endmodule 