module top_module(
    input [3:0] in,
    output reg [2:0] out_both,
    output reg [3:1] out_any,
    output reg [3:0] out_different
);

    integer i, j, k;
    always@(*)
    begin
        out_both = 3'b0;
        out_any = 3'b0;
        out_different = 4'b0;

        for(i=0; i<=2; i=i+1)
        begin
            out_both[i] = (in[i] && in[i+1]) ? 1 : 0;
        end

        for(j=3; j>=1; j=j-1)
        begin
            out_any[j] = (in[j] || in[j-1]) ? 1 : 0;
        end

        for(k=0; k<=2; k=k+1)
        begin
            out_different[k] = (in[k] ^ in[k+1]) ? 1 : 0;
        end

        if(in[3] ^ in[0])
            out_different[3] = 1;
    end



endmodule