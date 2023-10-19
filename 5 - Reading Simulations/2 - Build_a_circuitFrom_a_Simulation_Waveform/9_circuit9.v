module top_module (
    input clk,
    input a,
    output reg [3:0] q );

    //counter
    //a是上升沿同步复位指令，上升沿模6递增计数器
    always@(posedge clk)begin
        if(a)
            q <= 4'd4;
        else 
            if(q == 4'd6)   q <= 4'd0;
            else    q <= q + 1;
    end

endmodule