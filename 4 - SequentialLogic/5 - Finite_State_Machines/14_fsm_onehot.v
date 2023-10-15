//用OnehotFSM实现

module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);


    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9;

/** s   0   1
    0   0   1
    1   0   2
    2   0   3
    3   0   4
    4   0   5
    5   8   6
    6   9   7
    7   0   7 
    8   0   1
    9   0   1
**/

    assign next_state[S0] = (state[S0] & ~in) | (state[S1] & ~in) | (state[S2] & ~in) | (state[S3] & ~in) | (state[S4] & ~in) | (state[S7] & ~in) | (state[S8] & ~in) | (state[S9] & ~in);
    assign next_state[S1] = (state[S0] & in) | (state[S8] & in) | (state[S9] & in);
    assign next_state[S2] = (state[S1] & in);
    assign next_state[S3] = (state[S2] & in);
    assign next_state[S4] = (state[S3] & in);
    assign next_state[S5] = (state[S4] & in);
    assign next_state[S6] = (state[S5] & in);
    assign next_state[S7] = (state[S6] & in) | (state[S7] & in);
    assign next_state[S8] = (state[S5] & ~in);
    assign next_state[S9] = (state[S6] & ~in);

    assign out1 = state[S8] | state[S9];
    assign out2 = state[S9] | state[S7];

endmodule