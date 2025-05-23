module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    reg[15:0] sum1, sum2, sum3, muxout;
    wire cout_sel;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(cout_sel));
    add16 mux0(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum2));
    add16 mux1(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum3));
    
    assign muxout = cout_sel ? sum3 : sum2;
    assign sum = {muxout, sum1};
    

endmodule
