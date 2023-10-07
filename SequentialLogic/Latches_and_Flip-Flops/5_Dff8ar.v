// asynchronous reset �첽��λ
// ���Ұ��°�ť�Ҿ͸�λ�����ù�ʱ��


module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);

//The only difference in code between synchronous and asynchronous reset flip-flops is in the sensitivity list.
//���ǰ�always������б����޸ľͿ���ʵ���첽
    always@(posedge clk,posedge areset)
    begin
        if(areset)
            q = 8'b00000000;
        else
            q = d;
    
    end


endmodule