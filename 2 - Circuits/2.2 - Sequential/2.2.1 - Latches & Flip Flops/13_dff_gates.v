module top_module (
    input clk,
    input x,
    output z
); 
    wire dff1, dff2, dff3;
    wire xorg, andg, org;
    
    assign z = ~(dff1 | dff2 | dff3);
        
    always @(posedge clk) begin
        dff1 = x ^ dff1;
        dff2 = x & ~dff2;
        dff3 = x | ~dff3;
    end

endmodule
