module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    
    always @(posedge clk) begin
        if (reset) 
            Q <= 1;
            // c_load = 1;
        else if ((Q == 12) & enable)
            Q <= 1;
            // c_load = 1;
        else 
            Q <= enable ? Q+1: Q;
    end
    
    assign c_enable = enable;
    assign c_load = (reset | (Q == 12) & enable);
    assign c_d = c_load ? 1:0;
    
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
