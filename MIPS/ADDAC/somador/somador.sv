module somador(a,b,cin,cout,s);
	input logic a,b,cin;
	output logic cout, s;
	
	logic p, g;
	
	assign p = a^b;
	assign g = a&b;
	
	assign s = p^cin;
	assign cout = g|(p&cin);
endmodule