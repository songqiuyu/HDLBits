/**
Create a module with the same functionality as the 7458 chip.
 It has 10 inputs and 2 outputs. 
 You may choose to use an assign statement to drive each of the output wires, or you may choose to declare (four) wires for use as intermediate signals, where each internal wire is driven by the output of one of the AND gates. 
 For extra practice, try it both ways. 
**/

module top_module(
	input p1a,
	input p2a,
	input p2b,
	input p2c,
	input p2d,
	input p1c,
	input p1b,
	input p1f,
	input p1e,
	input p1d,

	output p1y,
	output p2y
	);


	wire and_gate1, and_gate2, and_gate3, and_gate4;

	assign and_gate1 = p2a & p2b;
	assign and_gate2 = p2c & p2d;
	assign and_gate3 = p1a & p1c & p1b;
	assign and_gate4 = p1f & p1e & p1d;

	assign p1y = and_gate3 | and_gate4;
	assign p2y = and_gate1 | and_gate2;


endmodule