module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    // state encoding
    parameter s0 = 3'b000, s1= 3'b001, s2= 3'b011, s3= 3'b111;
    reg[2:0] frtot = {fr1, fr2, fr3}
    reg[2:0] state, next_state;

    // State transition logic
    

    // s3s2s1 = 111 fr1fr2fr3 = 000
    // s3s2s1 = 011 fr1fr2fr3 = 100
    // s3s2s1 = 001 fr1fr2fr3 = 110
    // s3s2s2 = 000 fr1fr1fr3 = 111
    // If next_state < state, dfr = 1
    
    always @(*) begin
        case(state)
            
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            fr3 <= 1;
            fr2 <= 1;
            fr1 <= 1;
            dfr <= 0;
        end else begin
            // something here
            state <= next_state;
        end
    end
    

endmodule
