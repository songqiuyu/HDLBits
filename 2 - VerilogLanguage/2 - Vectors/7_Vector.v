module top_module(
    input [7:0] in,
    output [7:0] out
);

    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};


endmodule



/**

module top_module( 
    input [7:0] in,
    output [7:0] out
);

    integer i;
    always@(*)
        begin
            for(i = 0;i <= 7;i = i+1)
               out[i] = in[7-i];
        end

endmodule


**/