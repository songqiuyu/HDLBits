//synchronous reset ͬ����λ
// ͬ����λ��ζ�Ÿ�λ�Ǹ���ʱ�ӵģ�clkΪ�����ص�ʱ��ɼ���λ�ź�



module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg[7:0] q
);

    always@(posedge clk)
    begin
        if(reset)
            q = 8'b00000000;
        else
            q = d;

    end



endmodule