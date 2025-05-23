module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    reg[15:0] sum1, sum2;
    reg[31:0] b_xor;
    wire cout1;
    
    assign b_xor = b ^ {32{sub}};
    
    add16 inst1(.a(a[15:0]), .b(b_xor[15:0]), .cin(sub), .sum(sum1), .cout(cout1));
    add16 inst2(.a(a[31:16]), .b(b_xor[31:16]), .cin(cout1), .sum(sum2));
    
    assign sum = {sum2, sum1};
                

endmodule
