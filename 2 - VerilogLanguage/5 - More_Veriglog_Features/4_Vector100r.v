module top_module( 
    input [99:0] in,
    output reg[99:0] out
);

    integer k;
    always@(*)
    begin
        for(k=0; k<=99; k=k+1)
        begin
            out[k] = in[99-k];
        end
            
    end

endmodule