module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    //��ŵͼ��˳�򲢲���һ��Ϊ00 01 10 11��ֻҪ���϶���01 00 10 11Ҳ�ǿ��Ե�
    assign out = a || (~b && c);

endmodule