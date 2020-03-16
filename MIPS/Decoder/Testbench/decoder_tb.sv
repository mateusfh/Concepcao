`timescale 1ns/100ps

module decoder_tb;
	parameter max_vectors = 32;
	int counter, errors, aux_error, rst;
	
	logic clk;
	logic [4:0] a;
	logic [31:0] y, y_esperado;
	logic [36:0] vectors[max_vectors];
	integer file;
	
	decoder dut(.a(a), .y(y));

	initial begin
		file = $fopen("decoder_out.txt");
		$display("Iniciando o TestBench");
		$fwrite(file, "Iniciando o TestBench");
		$display("---------------------");
		$fwrite(file, "---------------------");
		$display("|Linha|  A  |              Y                 |");
		$fwrite(file, "|Linha|  A  |              Y                 |");		
		$readmemb("decoder.tv", vectors);
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
			{a, y_esperado} = vectors[counter];
			$display("| %0d | %b |%b|%b|", counter, a, y, y_esperado);
		end
	end
	
	always @(negedge clk) begin
		if (~rst) begin
			aux_error = errors;
			assert (y === y_esperado)				
			else begin
				errors = errors + 1;
			end
		/*	
			if(aux_error === errors) begin
				$display("| %0d | %b |%b| OK", counter, a, y);
                $fwrite(file, "| %0d | %b |%b| OK", counter, a, y);
            end
			else begin
				$display("| %0d | %b |%b| ERRO", counter, a, y);
                $fwrite(file, "| %0d | %b |%b| ERRO", counter, a, y);
            end
			*/
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