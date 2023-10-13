// 使用独热编码来表示FSM的自动机，仅此而已
// 为什么要使用独热编码，使用空间换取时间
// 下面你就看这奇妙的代码儿

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); 

    assign next_state[0] = (state[0] & ~in) | (state[2] & ~in);
    assign next_state[1] = (state[0] & in) | (state[1] & in) | (state[3] & in);
    assign next_state[2] = (state[1] & ~in) | (state[3] & ~in);
    assign next_state[3] = (state[2] & in);

    //我们只判断最高位！
    assign out = state[3];


endmodule