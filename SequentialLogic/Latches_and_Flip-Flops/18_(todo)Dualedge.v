//dual-edge triggered flip-flop
//Ë«±ßÑØ´¥·¢Æ÷

module top_module (
    input clk,
    input d,
    output q
);
    reg s1, s2;

    always@(posedge clk)begin
        s1 <= d;
    end


    always@(negedge clk)begin
        s2 <= d;
    end

    assign q = clk ? s1 : s2;

endmodule

