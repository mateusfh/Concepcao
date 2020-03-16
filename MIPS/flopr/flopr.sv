module flopr(input logic clk, reset, d,
             output logic y);

    always_ff @(posedge clk, posedge reset) begin
        if (reset) y = 0;
        else y = d;
    end

endmodule