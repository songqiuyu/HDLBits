//�����Ŀ�������ǣ��е����޷�ͨ����ŵͼ���л����
//��Ϊ��ŵͼֻ�ܻ���˼�
//���ʱ��Ҫ�ӹ�ʽ���֣��������������

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (a ^ b) ^ (c ^ d);
endmodule
