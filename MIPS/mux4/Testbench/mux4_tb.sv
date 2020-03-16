`timescale 1ns/100ps

module mux4_tb;
	parameter max_vectors = 64;
	int counter, errors;
	
	logic clk, s0, s1, d0, d1, d2, d3, y, y_esperado;
	logic [6:0] vectors[max_vectors];
	integer file;
	
	mux4 dut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s0(s0), .s1(s1), .y(y));

	initial begin
		file = $fopen("mux4_out.txt");
		$display("Iniciando o TestBench");
		$fwrite(file, "Iniciando o TestBench");
		$display("---------------------");
		$fwrite(file, "---------------------");
		$display("|Linha|  D0  |  D1  |  D2  |  D3  |  S0  |  S1  |  Y  |");
		$fwrite(file, "|Linha|  D0  |  D1  |  D2  |  D3  |  S0  |  S1  |  Y  |\n");		
		$readmemb("mux4.tv", vectors);
		counter = 0; errors = 0;
	end
	
	always begin
		clk = 1; #10;
		clk = 0; #5;
	end
	
	always @(posedge clk) begin
		{d0, d1, d2, d3, s0, s1, y_esperado} = vectors[counter];
	end
	
	always @(negedge clk) begin
		if (y_esperado !== 1'bx) begin
			assert (y === y_esperado) begin
				$display("|  %0d  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  | OK", counter, d0, d1, d2, d3, s0, s1, y);
				$fwrite(file, "|  %0d  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  | OK", counter, d0, d1, d2, d3, s0, s1, y);
			end
			else begin 
				
				assert (y === y_esperado) begin
				end
				else begin
					if (y_esperado != "x") begin
						$error("Erro na linha %d: ", counter, "d0 = %d || ", d0, "d1 = %d || ", d1, "d2 = %d || ", d2, "d3 = %d || ", d3, "s0 = %d || ", s0, "s1 = %d || ", s1, "y = %d || ", y, "y_esperado = %d", y_esperado);
						$fwrite(file, "Erro na linha %d: ", counter, "d0 = %d || ", d0, "d1 = %d || ", d1, "d2 = %d || ", d2, "d3 = %d || ", d3, "s0 = %d || ", s0, "s1 = %d || ", s1, "y = %d || ", y, "y_esperado = %d", y_esperado);
						errors++;
					end
				end

		end
		counter ++;
		if (counter == max_vectors) begin
			$display("Testes Efetuados = %0d", counter);
			$fwrite(file, "\nTestes Efetuados = %0d\n", counter);
			$display("Errors Encontrados = %0d", errors);
			$fwrite(file, "Errors Encontrados = %0d\n", errors);
			$fclose(file);

			#10;
			$stop;
			

		end

	end
	end


endmodule