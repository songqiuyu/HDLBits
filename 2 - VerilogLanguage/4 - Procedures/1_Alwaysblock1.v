/**
使用always修改的变量用reg修饰
组合电路描述 always@(*)
时序电路描述 always@(posedge clk)
**/

module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a & b;

    always@(*)
    begin
      out_alwaysblock = a & b;
    end

endmodule