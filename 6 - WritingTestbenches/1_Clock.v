/**
    

常用testbench结构
`timescale 1ns / 1ps
module 模块名称;
DUT输入信号定义 一般是reg类型
DUT输出信号定义 一般是wire类型

initial begin
    初始化定义各个信号
end

always begin
    一直循环执行需要变化的值
end


`timescale 1ns / 1ps时间单位和精度
时间单位就是模块中仿真时间和延迟时间的基本单位
时间精度是该模块仿真时间的精度程度，就是小数点后几位
1ns / 1ps就是所有时间都是1ns的整数倍，然后精确到小数点后三位

**/

`timescale 1ps/1ps

module top_module ( );
    reg clk;
    initial begin
        clk = 0;
    end

    dut t_dut(clk);

    always begin
        #5
        clk = ~clk;
    end
endmodule


module dut ( input clk ) ;
endmodule