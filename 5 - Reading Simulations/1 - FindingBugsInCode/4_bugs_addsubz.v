// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase
//~表示按位取反，!表示逻辑非
//按位取反输出7个值
        if (!out)
            result_is_zero = 1;
        else
            result_is_zero = 0;
    end    


endmodule