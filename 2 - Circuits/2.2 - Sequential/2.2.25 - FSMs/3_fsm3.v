module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF: begin
                if (j) begin
                    next_state <= ON;
                end
                else begin
                    next_state <= OFF;
                end
            end
            
            ON: begin
                if (k) begin
                    next_state <= OFF;
                end 
                else begin
                    next_state <= ON;
                end
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) state <= OFF;
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == ON) ? 1:0;

endmodule
