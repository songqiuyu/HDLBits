module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
); 

	wire enas0, enas1, enam0, enam1, enah0, enah1;
    wire h0mn;


    assign enas0 = ena;
    assign enas1 = (ss[3:0] == 4'd9 & enas0) ? 1 : 0;
	assign enam0 = (ss[7:4] == 4'd5 & enas1) ? 1 : 0;
	assign enam1 = (mm[3:0] == 4'd9 & enam0) ? 1 : 0;
    assign enah0 = (mm[7:4] == 4'd5 & enam1) ? 1 : 0;
    assign enah1 = (hh[3:0] == 4'd9 & enah0) | (hh[3:0] == 4'd2 & h0mn & enah0) ? 1 : 0;


    assign h0mn = (hh[7:4] == 4'd1) ? 1 : 0;

    //wire 类型是可以用在always中的，别太狭隘
    //此外，assign改变取反会直接卡住，要想边缘触发和电平触发的区别
    // assign pm = enah1 ? ~pm : pm;
    // 如果这样写，当enah1变为高电平，会疯狂取反，直接卡在这个位置，这个时候我们希望变一次，因此用边沿触发
	 always@(posedge clk)begin
			if(reset)
				pm <= 0;
			else if(hh == 8'h11 & enah0)
				pm <= ~pm;
	 end


    bcd h1(
        .clk(clk),
        .reset(reset),
        .ena(enah1),
        .rd(4'd1),
		  .rq(4'd0),
        .mn(4'd1),
        .q(hh[7:4])
    );

    bcd h0(
        .clk(clk),
        .reset(reset),
        .ena(enah0),
        .rd(4'd2),
		.rq(hh[7:4] == 4'd1 ? 4'd1: 4'd0),	
        .mn(hh[7:4] == 4'd1 ? 4'd2: 4'd9),
        .q(hh[3:0])
    );

    bcd m1(
        .clk(clk),
        .reset(reset),
        .ena(enam1),
        .rd(4'd0),
		.rq(4'd0),	
        .mn(4'd5),
        .q(mm[7:4])
    );

    bcd m0(
        .clk(clk),
        .reset(reset),
        .ena(enam0),
        .rd(4'd0),
		.rq(4'd0),		  
        .mn(4'd9),
        .q(mm[3:0])
    );

    bcd s1(
        .clk(clk),
        .reset(reset),
        .ena(enas1),
        .rd(4'd0),
		.rq(4'd0),		 
        .mn(4'd5),
        .q(ss[7:4])
    );

    bcd s0(
        .clk(clk),
        .reset(reset),
        .ena(enas0),
        .rd(4'd0),
		.rq(4'd0),		  
        .mn(4'd9),
        .q(ss[3:0])
    );




endmodule

module bcd(
    input clk, reset, ena,
    input [3:0] rd, mn, rq,
    output reg [3:0] q
);

    always@(posedge clk)begin
        if(reset)
            q <= rd;
        else if(ena)
            if(q == mn)
                q <= rq;
            else
                q <= q + 1;
    end

endmodule