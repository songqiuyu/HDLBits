
//An if statement usually 
//creates a 2-to-1 multiplexer
//Èý²Ù×÷·û out = (condition) ? true : false;
module top_module(
    input a, b, sel_b1, sel_b2,
    output wire out_assign,
    output reg out_always
);
    assign out_assign = (sel_b1 & sel_b2) ? b : a;

    always@(*)
    begin
      if(sel_b1 & sel_b2)
        out_always = b;
      else
        out_always = a;
    end


endmodule