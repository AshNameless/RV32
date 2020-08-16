`timescale 1ns / 1ps
module simu_controller( );
    reg [5:0] op; //op�ֶ�
    reg [5:0] func;//func�ֶ�
    reg [31:0] alur;  //alu��������
    reg equal;        //alu�Ƿ���ȵ��ж����
    wire  jump;    //��������֧
    wire  branch;  //��������֧�ɹ�
    wire  bat; //��������֧����
    wire  ret; //return ����
    wire  RegDst1; //
    wire  jal; //��������jal
    wire  RegDin1; //
    wire  shift;   //λ��
    wire  [3:0]ALUOP;   //alu�Ĳ�����
    wire  syscall; //ͣ��
    wire  RegWrite;  //д�Ĵ���  
    wire  sw;      //DMWrite д���ݴ洢��
    wire  [3:0]mode;    //���ݴ洢������ģʽ
    wire  AluB1;  //alu��b�����ѡ���ź�
    controller test_controller(
        .op(op),.func(func),.alur(alur),.equal(equal),
        .jump(jump),.branch(branch),.bat(bat),.ret(ret),
        .RegDst1(RegDst1),.jal(jal),.RegDin1(RegDin1),
        .shift(shift),.ALUOP(ALUOP),.syscall(syscall),
        .RegWrite(RegWrite),.sw(sw),.mode(mode),.AluB1(AluB1)
        );  
    initial begin
        op = 6'b001000;
       // func = 6'b;
        alur = 0;
        equal = 0;
    end
endmodule
