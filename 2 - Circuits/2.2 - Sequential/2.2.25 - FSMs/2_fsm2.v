// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0, B=1;
    reg present_state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(present_state)
            A: begin
                if (in) begin
                    next_state = A;
                end 
                else begin
                    next_state = B;
                end
            end
            
            B: begin 
                if (in) begin
                    next_state = B;
                end
                else begin
                    next_state = A;
                end
            end
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (reset) present_state <= B;
        else
            present_state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (present_state == B) ? 1 : 0;

endmodule
