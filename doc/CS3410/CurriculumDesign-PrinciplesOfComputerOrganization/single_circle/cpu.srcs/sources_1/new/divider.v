`timescale 1ns / 1ps
/*
    ��ϵͳʱ�ӽ��з�Ƶ������N��������ı䣬��ʱ�ӽ�����ͬƵ�� 
*/
module divider
#(parameter N = 100_000)
 (clk,parameterN,clk_N);
    input clk;                      // ϵͳʱ��
    input [3:0] parameterN;              //��Ƶ����
    output reg clk_N;               // ��Ƶ���ʱ��
    reg [31:0] counter;             /* ������������ͨ������ʵ�ַ�Ƶ��
                                   ����������0������(N/2-1)ʱ��
                                   ���ʱ�ӷ�ת������������ */
initial begin
   counter = 0; 
   clk_N = 0;
end
always @(posedge clk)  begin    // ʱ��������
    if(counter == N*parameterN/2 - 1)begin 
    	counter = 0;
    	clk_N = ~clk_N;
    end
    else 	counter = counter + 1;
end                           
endmodule
