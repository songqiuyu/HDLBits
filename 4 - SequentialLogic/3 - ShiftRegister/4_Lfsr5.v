// linear feedback shift register
// 线性反馈移位寄存器
// Galois型LFSR 线性反馈移位寄存器
// 说白了就是待反馈的移位寄存器
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
);

    always@(posedge clk)begin
        if(reset)
            q <= 5'h1;
        else
            q <= {1'b0 ^ q[0],q[4] ,q[3] ^ q[0] ,q[2] , q[1]};
    end


endmodule