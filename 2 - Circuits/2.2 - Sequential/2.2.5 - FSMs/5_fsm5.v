module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        next_state <= state;
        case(state)
            A: begin
                out = 0;
                if (in) begin
                    next_state <= B;
                end
                else begin
                    next_state <= A;
                end
            end
            
            B: begin
                out = 0;
                if (in) begin
                    next_state <= B;
                end
                else begin
                    next_state <= C;
                end
            end
            
            C: begin
                out = 0;
                if (in) begin
                    next_state <= D;
                end
                else begin
                    next_state <= A;
                end
            end
            
            D: begin
                out = 1;
                if (in) begin
                    next_state <= B;
                end
                else begin
                    next_state <= C;
                end
            end
        endcase
    end
    
    // Output logic:  out = f(state) for a Moore state machine
	
endmodule
