module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

//  pedge�Ǵ�0���1��λ
//  ~pedge(x)in(x)

//&��ʾ��λ�룬&&��ʾ�߼���
    //Ҫ����һ������ı���ȥ�洢��һ��״̬
    reg [7:0]q;
    always@(posedge clk)begin
        q <= in;   //q�б����������һ�������ֵ
        pedge <= ~q & in;   //����������һ������Ƚϣ����������ϴ���0�������1
    end


endmodule