module top_module( 
    input [99:0] in,
    output reg[98:0] out_both,
    output reg[99:1] out_any,
    output reg[99:0] out_different );

    integer i, j, k;
    always@(*)
    begin
        out_both = 99'b0;
        out_any = 99'b0;
        out_different = 100'b0;

        for(i=0; i<=98; i=i+1)
        begin
            out_both[i] = (in[i] && in[i+1]) ? 1 : 0;
        end

        for(j=99; j>=1; j=j-1)
        begin
            out_any[j] = (in[j] || in[j-1]) ? 1 : 0;
        end

        for(k=0; k<=98; k=k+1)
        begin
            out_different[k] = (in[k] ^ in[k+1]) ? 1 : 0;
        end

        if(in[99] ^ in[0])
            out_different[99] = 1;
    end



endmodule