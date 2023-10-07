module top_module(
    input [2:0] in,
    output reg [1:0] out
);
    integer i;

    always@(*)
    begin
        out = 2'd0;

        for(i=0; i<=2; i=i+1)
        begin
            out += in[i] == 1'b1 ? 1 : 0;
        end

    end

endmodule