module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );
// ����һ����򵥵�ʱ���·��D������


    always@(posedge clk)
    begin
        q = d;
    end


endmodule