//理解一件事情，assign语句是用来连接两个东西，而不是赋值，assign是有方向的connect
//assign本质是将已有的线进行connect

/**
Create a module with 3 inputs and 4 outputs that behaves like wires that makes these connections: 
a -> w
b -> x
b -> y
c -> z
**/
module top_module( 
    input a,b,c,
    output w,x,y,z );

	assign w = a;
	assign x = b;
	assign y = b;
	assign z = c;

endmodule
