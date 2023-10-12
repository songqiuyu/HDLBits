module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 
    // 卡诺图得到
    // q[i] = q[i] ^ q[i-1] + q[i] * ~q[i+1]
    // 注意~是按位取反，！是逻辑非！！！！！
    //！是逻辑非


    always@(posedge clk)begin
        if(load)
            q <= data;
        else begin
            q[0] <= (q[0] ^ 1'b0) | (q[0] & !q[1]);
            q[511] <= (q[511] ^ q[510]) | (q[511] & 1'b1);
            q[510:1] <= (q[510:1] ^ q[509:0]) | (q[510:1] & ~q[511:2]);
        end
    end
endmodule