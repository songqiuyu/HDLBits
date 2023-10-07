//写verilog的思想过程是先想好电路再编写代码
//Verilog's answer is: Keep the outputs unchanged. 
//组合逻辑是不能记忆的，带有记忆功能的必须是时序逻辑电路
module top_module(
    input cpu_overheated,
    output reg shut_off_computer,
    input arrived,
    input gas_tank_empty,
    output reg keep_driving
);

    always @(*) 
    begin
        if (cpu_overheated)
            shut_off_computer = 1;
        else
            shut_off_computer = 0;
    end

    always @(*) 
    begin
        if (~arrived)
            keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;
    end



endmodule
