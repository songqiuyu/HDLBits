//In a combinational always block, use blocking assignments. 
//In a clocked always block, use non-blocking assignments.
module top_module(
    input a, b, clk,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff
);
    assign out_assign = a ^ b;

    always@(*)
    begin
        out_always_comb = a ^ b;
    end
    
    //时钟上升沿的时候改变
    always@(posedge clk)
    begin
        out_always_ff = a ^ b;
    end

endmodule