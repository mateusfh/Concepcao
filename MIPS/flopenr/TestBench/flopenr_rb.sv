`timescale 1ns/100ps

module flopenr_rb;
	parameter max_vectors = 16;
	int counter, errors, aux_error;
	
	logic clk, clkA, rst, rstA, en, d, q, q_esperado;
	logic [4:0] vectors[max_vectors];
	integer file;
	
	flopenr flopenr(.clk(clkA), .reset(rstA), .en(en), .d(d), .q(q));

	initial begin
		file = $fopen("flopenr_out.txt");
		$display("Iniciando o TestBench");
		$fwrite(file, "Iniciando o TestBench");
		$display("---------------------");
		$fwrite(file, "---------------------");
		$display("|Linha| CLK | RST | EN  |  D  |  Q  |");
		$fwrite(file, "|Linha| CLK | RST | EN  |  D  |  Q  |");		
		$readmemb("flopenr.tv", vectors);
		counter = 0; errors = 0;
		rst = 1; #10; rst = 0;
	end
	
	always begin
		#15;
		clk = 1; #20;
		clk = 0; #10;
	end
	
	always @(posedge clk) begin
		if (~rst)begin
			{d, rstA, en, clkA, q_esperado} = vectors[counter];
			
		end
	end
	
	always @(negedge clk) begin
		if (~rst) begin
			aux_error = errors;
			assert (q === q_esperado)				
			else begin
				errors = errors + 1;
			end
			
			if(aux_error === errors) begin
				$display("| %b | %b | %b | %b | %b | OK", clkA, rstA, en, d, q);
                $fwrite(file, "| %b | %b | %b | %b | %b | OK", clkA, rstA, en, d, q)
            end
			else begin
				$display("| %b | %b | %b | %b | %b | ERRO", clkA, rstA, en, d, q);
                $fwrite(file, "| %b | %b | %b | %b | %b | %b | ERRO", clkA, rstA, en, d, q, q_esperado)
            end
			
			
			counter++;
			if (counter == max_vectors) begin
				$display("Testes Efetuados = %0d", counter);
				$fwrite(file, "\nTestes Efetuados = %0d\n", counter);
				$display("Errors Encontrados = %0d", errors);
				$fwrite(file, "Errors Encontrados = %0d\n", errors);
				$fclose(file);
				$display("Testes Efetuados  = %0d", counter);
				$display("Erros Encontrados = %0d", errors);
				#10
				$stop;
			end
		end
	end
endmodule