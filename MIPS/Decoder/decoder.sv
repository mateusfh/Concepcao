module decoder2x4( input logic [1:0] a,
                   output logic [3:0] y);
 
    assign y[0] = ~a[0]&~a[1];
    assign y[1] =  a[0]&~a[1];
    assign y[2] = ~a[0]&a[1];
    assign y[3] =  a[0]&a[1];
 
endmodule


module decoder3x8( input logic [2:0] a,
                   input logic en,
                   output reg [7:0] y);
 
    always @(*) begin
        if (en==1) begin    
            y[0] = ~a[0]&~a[1]&~a[2];
            y[1] = a[0]&~a[1]&~a[2];
            y[2] = ~a[0]&a[1]&~a[2];
            y[3] = a[0]&a[1]&~a[2];
            y[4] = ~a[0]&~a[1]&a[2];
            y[5] = a[0]&~a[1]&a[2];
            y[6] = ~a[0]&a[1]&a[2];
            y[7] = a[0]&a[1]&a[2];
        end
        else begin
            y = 8'b0;
        end
        
    end
 
endmodule

module decoder( input logic [4:0] a,
                output logic [31:0] y);
    
    wire [3:0] enable;
    
    decoder2x4 decoder2x4_0(.a(a[4:3]), .y(enable[3:0]));
    
    decoder3x8 decoder3x8_0(.a(a[2:0]), .en(enable[0]), .y(y[7:0]));
    decoder3x8 decoder3x8_1(.a(a[2:0]), .en(enable[1]), .y(y[15:8]));
    decoder3x8 decoder3x8_2(.a(a[2:0]), .en(enable[2]), .y(y[23:16]));
    decoder3x8 decoder3x8_3(.a(a[2:0]), .en(enable[3]), .y(y[31:24]));
                
endmodule 
