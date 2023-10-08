//做一个4位十进制计数器

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);



    assign ena[1] = (q[3:0] == 4'd9) ? 1 : 0;
    assign ena[2] = (q[7:4] == 4'd9 & ena[1]) ? 1 : 0;
    assign ena[3] = (q[11:8] == 4'd9 & ena[1] & ena[2]) ? 1 : 0;

    bcdcounter q0(
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .q(q[3:0])
    );

    bcdcounter q1(
        .clk(clk),
        .reset(reset),
        .enable(ena[1]),
        .q(q[7:4])
    );
    
    bcdcounter q2(
        .clk(clk),
        .reset(reset),
        .enable(ena[2]),
        .q(q[11:8])
    );
    
    bcdcounter q3(
        .clk(clk),
        .reset(reset),
        .enable(ena[3]),
        .q(q[15:12])
    );
endmodule


module bcdcounter(
    input clk, reset, enable,
    output reg [3:0] q
);
    always@(posedge clk)begin
        if(reset)
            q <= 0;
        else if(enable)
            if(q == 4'd9)
                q <= 0;
            else
                q <= q + 1;
    end

endmodule