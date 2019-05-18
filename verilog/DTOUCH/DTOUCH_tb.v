  `timescale 1ns/100ps    //仿真时间单位/时间精度
  module DTOUCH_tb();       
   reg    clk,rst,d;         	//需要产生的激励信号定义
   wire   q,qb;      	  //需要观察的输出信号定义 
   //初始化过程块
   initial
   begin
	 clk = 0;
	 rst = 0;
	 d = 0;
	 #50
	 rst = 1;
   end
   always #10 clk = ~clk;      //产生输入clk，频率50MHz
   always #15 d = ~d;
   //module调用例化格式
   DTOUCH  u1 (      //DOUTCH表示所要例化的module名称，u1是我们定义的例化名称
		.clk(clk),     //输入输出信号连接。
		.rst(rst),
		.d(d),
		.q(q),    //输出信号连接
		.qb(qb)   
           );
  endmodule