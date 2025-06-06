module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer j;
    always @(*) begin
        for(j = 0; j < 100; j=j+1)
            out[j] = in[99-j];
    end

endmodule
