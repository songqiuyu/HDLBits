//为了避免赋值有问题，最好的方式就是在case语句之前为输出指定一个默认值

/**
always @(*) begin
    up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
    case (scancode)
        ... // Set to 1 as necessary.
    endcase
end

This style of code 
ensures the outputs 
are assigned a value (of 0) in all possible cases unless the case statement 
overrides the assignment.
**/

module top_module(
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up
);

    always@(*)
    begin
        //表示我只要没有按键就直接都是0，不需要写default
        left = 1'b0;down = 1'b0;right = 1'b0;up = 1'b0;
        case(scancode)
            16'he06b: 
                left = 1'b1;
            16'he072: 
                down = 1'b1;
            16'he074: 
                right = 1'b1;
            16'he075: 
                up = 1'b1;
        endcase

    end


endmodule