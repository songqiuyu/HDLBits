module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    assign out_sop = (c && d) || (~a && ~b && c);

    //POS要取零的即可，并且不用取反！
    assign out_pos = c && (~b || d) && (~a || d);

endmodule