module SwitchFreq(select,CLK,clk);
  input select;
  input CLK;
  output reg clk;
  wire clk1,clk2;
  //assign clk = CLK;
  
  divider_ #(2)  divider1
     (
        .clk(CLK),.parameterN(1),.clk_N(clk1)
        );
  divider_ #(1000000)  divider2
           (
              .clk(CLK),.parameterN(1),.clk_N(clk2)
              );
  always @(posedge CLK) begin
  	if (select)
  		clk <= clk1;
  	else
  		clk <= clk2;
  end
  
endmodule

/*
    ��ϵͳʱ�ӽ��з�Ƶ������N��������ı䣬��ʱ�ӽ�����ͬƵ�� 
*/
module divider_
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
