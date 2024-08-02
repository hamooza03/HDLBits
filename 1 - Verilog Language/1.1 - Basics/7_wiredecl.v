`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire ab;
    wire cd;
    
    wire abcd;
    
    assign ab = a & b;
    assign cd = c & d;
    
    assign abcd = ab | cd;
    
    assign out = abcd;
    assign out_n = ~abcd;

endmodule
