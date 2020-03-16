`timescale 1ns/100ps
module addac_tb;
	parameter max_vectors = 16;
	
	int counter, errors, aux_errors;
	logic clk, a, rst, clock, sel0, sel1, acc;
	logic cout, s, s_esperado, cout_esperado;
	logic [6:0] vectors[max_vectors];
	
	addac dut(.a(a), .sel0(sel0), .sel1(sel1), .clk(clk), .acc(acc), .y(s), .cout(cout));
		
	initial begin 
		$display("Iniciando Testbench");
		$display("| a | s1 | s2 | clk | acc | s | cout | se| cEsp |"); 
		$display("------------------------------------------------");
		$readmemb("addac.tv", vectors);
		counter=0; errors=0;
		rst = 1; #20; rst = 0;	
	end
	
	always begin
		#30;
		clock = 1; #30;
		clock = 0;
	end
	
	always @(posedge clock) begin
		if (~rst) begin
			{a, sel0, sel1, clk, acc, s_esperado, cout_esperado} = vectors[counter];
		end
	end
	
	always @(negedge clock) begin
		if (~rst) begin
			aux_errors = errors;
			assert ((s === s_esperado) && (cout === cout_esperado))
			else begin
				errors = errors + 1;
			end
			
			if (aux_errors === errors) 
				$display("| %b | %b  |  %b |  %b  |  %b  | %b |   %b  | %b |  %b   | OK", a, sel0, sel1, clk, acc, s, cout, s_esperado, cout_esperado);
			else 
				$display("| %b | %b  |  %b |  %b  |  %b  | %b |   %b  | %b |  %b   | ERRO", a, sel0, sel1, clk, acc, s, cout, s_esperado, cout_esperado);
		
			counter++;
			if (counter == max_vectors) begin
				$display("Testes Efetuados  = %0d", counter);
				$display("Erros Encontrados = %0d", errors);
				#10
				$stop;
			end
		end
	end
	
endmodule
