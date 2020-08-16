module ALU(
    input  [31:0] X,
    input  [31:0] Y,
    input  [3:0] S,    //ѡ���ź�4λ
    output reg [31:0] Result1,   //���1 32λ
    output reg [31:0] Result2,   //����ź�2 32λ
    output reg OF,
    output reg UOF,
    output reg Equal
    );
    integer  i;//iҪ�����涨�壬����һ�㲻Ҫ��ѭ����ѭ���Ƿ����ʱ���õģ��ۺϵ�ʱ��Ҫ��
    //reg [63:0] mul;
    reg [63:0] X64;
    reg [63:0] Y64;
    
    initial begin
        Result1=0;
        Result2=0;
        OF=0;
        UOF=0;
        Equal=0;
    end
    always@(*) begin
        Equal=!(X^Y);
     case(S)
                 0:    begin   //��������
                           Result1 = X<<Y;
                        end 
                 1:     begin      //��������
                                            Result1=X;
                 for( i=0;i < Y&&i<=31;i=i+1)
                     begin
                           Result1 = {Result1[31],Result1[31:1]};
                    end
                        end 
                 2:     begin  //�߼�����

                         Result1 = X>>Y;
                        end 
                 3:     begin       //�˷�����
                            X64={32'b00000000000000000000000000000000,X};   //��չ��64λ
                            Y64={32'b00000000000000000000000000000000,Y};
                            X64=X64*Y64;                                    //������64λ�Ĵ�����
                            Result1=X64[31:0];                              //�ֽ���ֵ
                            Result2=X64[63:32];
                        end 
                 4: begin
                        Result1=X/Y;
                        Result2=X%Y;
                      end 
                 5:begin            //�ӷ�
                        Result1=X+Y;
                        OF=(X[31]^Result1[31])&(Y[31]^Result1[31]);     //�жϷ��������
                        UOF=Result1<X||Result1<Y;                 //�ж��޷��żӷ����
                       end 
                 6:begin        //����
                        Result1=X-Y;
                        OF=(X[31]^Result1[31])&(!Y[31]^Result1[31]);     //�жϷ��������
                        UOF=Result1>X||Result1>Y;                  //�ж��޷��żӷ����
                       
                       end 
                 7:begin        //��λ��
                        Result1=X&Y;
                      end 
                 8:begin        //��λ��
                        Result1=X|Y;
                     end 
                 9:begin        //��λ���
                        Result1=X^Y;
                    end 
                 10:begin       //��λ���
                        Result1=~(X|Y);
                       end 
                 11:begin       //���űȽϣ�xС��y����1
                        Result1=((X<Y)&(!X[31])&(!Y[31]))|((X>Y)&X[31]&Y[31])|((X[31]^Y[31])&X[31]);
                     end 
                 12:begin       //�޷��űȽϣ�xС��y����1
                        Result1=X<Y;
                  end 
                 default: ;
                 endcase
             end
endmodule
