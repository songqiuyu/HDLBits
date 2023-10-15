module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done);

    reg[1:0] y, Y;
    //既然没有规定只在done输出out_bytes，那我就找一个上升沿左移8bit的寄存器变量不就完了
    reg[23:0]save_bytes;
    parameter A = 2'b00, B =2'b01, C = 2'b10, D = 2'b11;

    always@(*)begin
        case(y)
            A:  if(in[3])begin
                    Y <= B;
                end
                else        Y <= A;
            B:  begin
                    Y <= C;
                end
            C:  begin
                    Y <= D;
                end
            D:  if(in[3])begin
                    Y <= B;
                end
                else        Y <= A;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else begin
            y <= Y;
            //每次上升沿保存新的一个字节
            save_bytes = {save_bytes[15:0], in};
        end
    end

    assign done = (y == D);
    assign out_bytes = save_bytes;

endmodule
