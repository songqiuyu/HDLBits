module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);

    counter c(
        .clk(clk),
        .l(load),
        .d(data),
        .tc(tc)
    );

endmodule


module counter(
    input clk, l,
    input [9:0] d,
    output reg tc
);
    reg [9:0]q;
    always@(posedge clk)begin
        if(l)
            q = d;
        else if(q != 0)
            q = q-1;

        if(q == 0)
            tc = 1;
        else
            tc = 0;
    end

endmodule