`default_nettype none	//关闭implicit nets,如果没定义，则未定义的类型就会赋值为wire类型

module top_module(
	input wire [15:0] in,
	output wire[7:0] out_hi,
	output wire [7:0] out_lo);

	assign out_hi = in[15:8];
	assign out_lo = in[7:0];

endmodule
