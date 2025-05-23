module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    reg[15:0] sum1, sum2;
    wire addout;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(addout));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(addout), .sum(sum2));
    
    assign sum = {sum2, sum1};

endmodule
