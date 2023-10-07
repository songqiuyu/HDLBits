//D-latch D锁存器，并不是时序电路，D锁存器就是Ena使能就通
//D-latch和D-flip-flop的区别就是，有没有那个三角

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