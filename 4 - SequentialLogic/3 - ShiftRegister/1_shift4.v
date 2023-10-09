//做一个四位右移寄存器
//异步复位
//同步置位
//还有使能端
//使能只是控制右移的，不影响load！
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always@(posedge clk, posedge areset)begin
        if(areset)
            q <= 0;
        else
            if(load)
                q <= data;
            else if(ena)
                q <= {1'b0, q[3:1]};
    end

endmodule
