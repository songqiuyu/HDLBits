//D-latch D��������������ʱ���·��D����������Enaʹ�ܾ�ͨ
//D-latch��D-flip-flop��������ǣ���û���Ǹ�����

module top_module (
    input d, 
    input ena,
    output reg q);

    always @(*)
    begin
        if(ena)
            q <= d;
    end

endmodule