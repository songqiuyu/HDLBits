//水池检测装置
//5-inch intervals
//water 到S3，flowrate = 0

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter	S0	=	4'b0000;
    parameter	S1	=	4'b0001;
    parameter	S2	=	4'b0010;
    parameter	S3	=	4'b0011;
    parameter	S4	=	4'b0110;
    parameter	S5	=	4'b0111;
    parameter	S6	=	4'b1110;
    parameter	S7	=	4'b1111;
    
    reg	[3:0]	state,next_state;
    
    always@(*)begin
        case(state)
            S0:next_state<=	(s==7)?S0:(s>=3)?S3:(s>=1)?S5:S7;
            S1:next_state<= (s==7)?S1:(s>=3)?S3:(s>=1)?S5:S7;
            S2:next_state<= (s==7)?S0:(s>=3)?S2:(s>=1)?S5:S7;
            S3:next_state<= (s==7)?S0:(s>=3)?S3:(s>=1)?S5:S7;
            S4:next_state<= (s==7)?S0:(s>=3)?S2:(s>=1)?S4:S7;
            S5:next_state<= (s==7)?S0:(s>=3)?S2:(s>=1)?S5:S7;
            S6:next_state<= (s==7)?S0:(s>=3)?S2:(s>=1)?S4:S7;
            S7:next_state<= (s==7)?S0:(s>=3)?S2:(s>=1)?S4:S7;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin
            state	<=	S7;
        end
        else begin
            state	<=	next_state;
        end
    end
    
    assign	{fr3,fr2,fr1,dfr}	=	state;

endmodule

