module top_module (
    input clock,
    input a,
    output reg p,
    output reg q );

    //D锁存器
    always @(*) begin
        if(clock)
            p = a;
    end
    //下降沿触发器
    always @(negedge clock) begin
        if(a)
            q <= 1;
        else
            q <= 0;
    end


endmodule
