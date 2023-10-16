module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
); 
    
    // 模拟串口的操作
    // 状态尽量见名知意
    reg [3:0]y, Y;
    //等待位
    parameter [3:0] IDLE = 4'd0;
    //开始位
    parameter [3:0] START = 4'd1;
    //bit0 - bit7
    parameter [3:0] BIT0 = 4'd2;
    parameter [3:0] BIT1 = 4'd3;
    parameter [3:0] BIT2 = 4'd4;
    parameter [3:0] BIT3 = 4'd5;
    parameter [3:0] BIT4 = 4'd6;
    parameter [3:0] BIT5 = 4'd7;
    parameter [3:0] BIT6 = 4'd8;
    parameter [3:0] BIT7 = 4'd9;
    parameter [3:0] PARITY = 4'd10;
    //停止位
    parameter [3:0] STOP = 4'd11;
    //错误位
    parameter [3:0] ERROR = 4'd12;
    wire odd;
    reg checkodd;

    //题目意思是如果没有接收到停止位就不输出done了。。。
    always@(*)begin
        case(y)
            IDLE: Y <= in ? IDLE : START;
            START: Y <= BIT0;
            BIT0: Y <= BIT1;
            BIT1: Y <= BIT2;
            BIT2: Y <= BIT3;
            BIT3: Y <= BIT4;
            BIT4: Y <= BIT5;
            BIT5: Y <= BIT6;
            BIT6: Y <= BIT7;
            BIT7: Y <= PARITY;
            PARITY: Y <= (in) ? STOP : ERROR;
            STOP: Y <= in ? IDLE : START;
            ERROR: Y <= in ? IDLE : ERROR;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= IDLE;
        else begin
            y <= Y;   
            if(Y != IDLE && Y != START && Y != STOP && Y != ERROR && Y != PARITY)begin
                out_byte <= {in , out_byte[7:1]};
            end         
        end
    end

    //什么时候reset？
    //当我按下reset键，或者当我开始接收前
    // reset || Y == START
    parity check(
        .clk(clk),
        .reset(reset || Y == START),
        .in(in),
        .odd(odd)
    );

    //为什么要加这一部分？不是很懂
    //TODO
    always @(posedge clk) begin
        if(reset)
            checkodd <= 0;
        else
            checkodd <= odd;
    end

    assign done = (y == STOP) & checkodd;

endmodule


module parity (
    input clk,
    input reset,
    input in,
    output reg odd);

    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;

endmodule
