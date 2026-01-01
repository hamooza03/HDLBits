module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    // When digging, only transition can be digging or falling (if ground=0)
    parameter LEFT=0, RIGHT=1, FALL_LEFT=2, FALL_RIGHT=3, DIG_LEFT=4, DIG_RIGHT=5;
    reg [2:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT : begin
                if (!ground) begin
                    next_state = FALL_LEFT;
                end
                else if (dig) begin
                    next_state = DIG_LEFT;
                end
                else if (bump_left) begin
                    next_state = RIGHT;
                end
                else begin
                    next_state = LEFT;
                end
            end

            RIGHT : begin
                if (!ground) begin
                    next_state = FALL_RIGHT;
                end
                else if (dig) begin
                    next_state = DIG_RIGHT;
                end
                else if (bump_right) begin
                    next_state = LEFT;
                end
                else begin
                    next_state = RIGHT;
                end
            end

            FALL_LEFT : begin
                if (ground) begin
                    next_state = LEFT;
                end
                else begin
                    next_state = FALL_LEFT;
                end
            end

            FALL_RIGHT : begin
                if (ground) begin
                    next_state = RIGHT;
                end
                else begin
                    next_state = FALL_RIGHT;
                end
            end

            DIG_LEFT : begin
                if (!ground) begin
                    next_state = FALL_LEFT;
                end
                else begin
                    next_state = DIG_LEFT;
                end
            end

            DIG_RIGHT : begin
                if (!ground) begin
                    next_state = FALL_RIGHT;
                end
                else begin
                    next_state = DIG_RIGHT;
                end
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) state <= LEFT;
        else
            state <= next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_LEFT) || (state == FALL_RIGHT);
    assign digging = (state == DIG_LEFT) || (state == DIG_RIGHT);

endmodule
