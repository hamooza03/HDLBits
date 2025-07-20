module top_module (
    input clk,
    input d,
    output q
);
    wire qpos, qneg;
    
    always @(posedge clk) begin
        qpos <= d;
    end
    
    always @(negedge clk) begin
        qneg <= d;
    end
    
    always @(*) begin
        if (clk) q <= qpos;
        else
            q <= qneg;
    end

endmodule
