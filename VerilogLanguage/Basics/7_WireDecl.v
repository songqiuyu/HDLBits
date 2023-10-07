
// 使用wire语句

module top_module(
	input a,
	input b,
	input c,
	input d,
	output out,
	output out_n);

	wire and_output1, and_output2;
	wire or_output;

	assign and_output1 = a & b;
	assign and_output2 = c & d;
	assign or_output = and_output1 | and_output2;
	assign out = or_output;
	assign out_n = ~or_output;

endmodule

//不使用wire语句
// module top_module(
// 	input a,
// 	input b,
// 	input c,
// 	input d,
// 	output out,
// 	output out_n);

// 	assign out = (a & b) | (c & d);
// 	assign out_n = ~out;

// endmodule