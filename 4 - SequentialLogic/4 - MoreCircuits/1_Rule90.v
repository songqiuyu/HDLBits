// 一维元胞自动机Rule90
/**
    什么叫一维元胞自动机
    自身只会受到左侧和右侧的影响
    注意本题目
    Assume the boundaries (q[-1] and q[512]) are both zero (off)！
    Assume the boundaries (q[-1] and q[512]) are both zero (off)！
    Assume the boundaries (q[-1] and q[512]) are both zero (off)！
    Assume the boundaries (q[-1] and q[512]) are both zero (off)！
**/

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 


    always@(posedge clk)begin
        if(load)
            q <= data;
        /**
            q <= 00000001;
            q <= 00000010;
            q <= 00000101;


            1010101
           10000000
           
        **/ 
        else    // 0>511<510    511>510<509     2>1<0   1>0<511
            q <= {q[510] ^ 1'b0, q[511:2] ^ q[509:0] , q[1] ^ 1'b0};
            /**
            q[0] <= q[1] ^ q[511];
            q[511] <= q[0] ^ q[510];
            for(i=1; i<=510; i=i+1)begin
                q[i] <= q[i+1] ^ q[i-1];
            end
            **/
    end

endmodule