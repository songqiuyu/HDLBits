module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter [3:0]IDLE = 4'd0;
    parameter [3:0]BIT0 = 4'd1;
    parameter [3:0]BIT1 = 4'd2;
    parameter [3:0]BIT2 = 4'd3;
    parameter [3:0]BIT3 = 4'd4;
    parameter [3:0]BIT4 = 4'd5;
    parameter [3:0]BIT5 = 4'd6;
    parameter [3:0]DISC = 4'd7;
    parameter [3:0]FLAG = 4'd8;
    parameter [3:0]ERROR = 4'd9;

    reg [3:0]y, Y;

    always@(*)begin
        case(y)
            IDLE:   if(in)  Y <= BIT0;
                    else Y <= IDLE;
            BIT0:   if(in)  Y <= BIT1;
                    else Y <= IDLE;
            BIT1:   if(in)  Y <= BIT2;
                    else Y <= IDLE;        
            BIT2:   if(in)  Y <= BIT3;
                    else Y <= IDLE;  
            BIT3:   if(in)  Y <= BIT4;
                    else Y <= IDLE;  
            BIT4:   if(in)  Y <= BIT5;
                    else Y <= DISC;  
            BIT5:   if(in)  Y <= ERROR;
                    else Y <= FLAG;  
            DISC:   if(in)  Y <= BIT0;
                    else    Y <= IDLE;
            FLAG:   if(in)  Y <= BIT0;
                    else    Y <= IDLE;
            ERROR:  if(in)  Y <= ERROR;
                    else Y <= IDLE;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= IDLE;
        else
            y <= Y;
    end

    assign disc = (y == DISC);
    assign flag = (y == FLAG);
    assign err = (y == ERROR);

endmodule