//integrated curcuits ���ɵ�·
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    //������һ�ֱȽ��µĶ���
    assign p1y = {p1a, p1b, p1c, p1d} == 4'b1111 ? 0 : 1;
    //��Ƚϴ�ͳ
    assign p2y = ~(p2a && p2b && p2c && p2d);
    

endmodule
