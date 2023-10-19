module top_module (
    input a, 
    input b, 
    input c, 
    output out);

    //nand 与非门
    wire t;
    andgate inst1 (t, a, b, c, 1'b1, 1'b1);
    assign out = ~t;

endmodule






module andgate ( 
    output out, 
    input a, 
    input b, 
    input c, 
    input d, 
    input e );
endmodule