module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    // Rename KEY to retreive clk and L signals
    wire clk, L;
    assign clk = KEY[0];
    assign L = KEY[1];
    
    // Rename SW to r..
    wire r0, r1, r2;
    assign r0 = SW[0];
    assign r1 = SW[1];
    assign r2 = SW[2];
    
    // Inputs to registers
    wire d0, d1, d2;
    
    


endmodule
