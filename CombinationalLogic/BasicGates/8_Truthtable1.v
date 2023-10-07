//Truthtable 真值表
/**
one way to describe 
the behaviour of a combinational function 
is to explicitly list what the output 
should be for every possible value of the inputs. 
This is a truth table. 

N输入的真值表，有2 ^ N 列中可能的组合逻辑
**/

module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f = (~x3 && x2 && ~x1) || (~x3 && x2 && x1) || (x3 && ~x2 && x1) || (x3 && x2 && x1);


endmodule