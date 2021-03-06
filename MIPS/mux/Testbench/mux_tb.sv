`timescale 1ns/100ps

module mux_tb;
	parameter max_vectors = 8;
	int counter, errors;
	
	logic clk, s, d0, d1, y, y_esperado;
	logic [3:0] vectors[max_vectors];
	integer file;
	
	mux2 dut(.d0(d0), .d1(d1), .s(s), .y(y));

	initial begin
		file = $fopen("mux_out.txt");
		$display("Iniciando o TestBench");
		$fwrite(file, "Iniciando o TestBench");
		$display("---------------------");
		$fwrite(file, "---------------------");
		$display("|Linha| D0  | D1  |  S  |  Y  |");
		$fwrite(file, "|Linha| D0  | D1  |  S  |  Y  |\n");		
		$readmemb("mux.tv", vectors);
		counter = 0; errors = 0;
	end
	
	always begin
		clk = 1; #10;
		clk = 0; #5;
	end
	
	always @(posedge clk) begin
		{d0, d1, s, y_esperado} = vectors[counter];
	end
	
	always @(negedge clk) begin
		assert (y_esperado !== 1'bx) begin
			assert (y === y_esperado) begin
				$display("|  %0d  |  %b  |  %b  |  %b  |  %b  | OK", counter, d0, d1, s, y);
				$fwrite(file, "|  %0d  |  %b  |  %b  |  %b  |  %b  | OK\n", counter, d0, d1, s, y);
			end
			else begin 
				
				assert (y === y_esperado) begin
				end
				else begin
					if (y_esperado != "x") begin
						$error("Erro na linha %d: ", counter, "d0 = %d || ", d0, "d1 = %d || ", d1, "s = %d || ", s, "y = %d || ", y, "y_esperado = %d", y_esperado);
						$fwrite(file, "Erro na linha %d: ", counter, "d0 = %d || ", d0, "d1 = %d || ", d1, "s = %d || ", s, "y = %d || ", y, "y_esperado = %d", y_esperado);
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