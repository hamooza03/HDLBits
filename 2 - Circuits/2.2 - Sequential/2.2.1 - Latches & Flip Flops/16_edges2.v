module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg[7:0] inter;
    
    always @(posedge clk) begin
        inter <= in;
        anyedge <= inter ^ in;
    end

endmodule
