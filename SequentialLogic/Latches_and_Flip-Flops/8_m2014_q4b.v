//带三角是触发器

module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset   异步复位
    output reg q);

    always@(posedge clk, posedge ar)begin
        if(ar)
            q <= 0;
        else
            q <= d;

    end


endmodule