module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);

    reg [31:0]shift_reg;	//用于32bit移位寄存器
    always@(posedge clk,posedge areset)begin
        if(areset)
            shift_reg  <= 31'b0;
        else if(train_mispredicted)	//优先级高
            shift_reg <= {train_history[30:0],train_taken};
        else if(predict_valid)
            shift_reg <= {shift_reg[30:0],predict_taken};
        else
            shift_reg <= shift_reg;
    end
    
    assign predict_history = shift_reg;
    
endmodule
