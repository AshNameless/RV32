nop
nop
nop
addi $sp,$sp,-4   #25���Ĵ���ѹջ
sw $1,0($sp)
addi $sp,$sp,-4
sw $2,0($sp)
addi $sp,$sp,-4
sw $3,0($sp)
addi $sp,$sp,-4
sw $4,0($sp)
addi $sp,$sp,-4
sw $5,0($sp)
addi $sp,$sp,-4
sw $6,0($sp)
addi $sp,$sp,-4
sw $7,0($sp)
addi $sp,$sp,-4
sw $8,0($sp)
addi $sp,$sp,-4
sw $9,0($sp)
addi $sp,$sp,-4
sw $10,0($sp)
addi $sp,$sp,-4
sw $11,0($sp)
addi $sp,$sp,-4
sw $12,0($sp)
addi $sp,$sp,-4
sw $13,0($sp)
addi $sp,$sp,-4
sw $14,0($sp)
addi $sp,$sp,-4
sw $15,0($sp)
addi $sp,$sp,-4
sw $16,0($sp)
addi $sp,$sp,-4
sw $17,0($sp)
addi $sp,$sp,-4
sw $18,0($sp)
addi $sp,$sp,-4
sw $19,0($sp)
addi $sp,$sp,-4
sw $20,0($sp)
addi $sp,$sp,-4
sw $21,0($sp)
addi $sp,$sp,-4
sw $22,0($sp)
addi $sp,$sp,-4
sw $23,0($sp)
addi $sp,$sp,-4
sw $24,0($sp)
addi $sp,$sp,-4
sw $25,0($sp)

MFC0 $1,$1	#�����ֵ��Ĵ���$1
#$1��������ѹջ
addi $sp,$sp,-4
sw $1,0($sp)

MFC0 $2,$2	#EPC���Ĵ���$2
#$2��EPCѹջ
addi $sp,$sp,-4
sw $2,0($sp)
#ջ��-EPC-������-$31-$0

addi $1,$0,0xe	#1���жϵ������֣�4λ
MTC0 $1,$1	#����������Ϊ1110

addi $3,$0,0x1	#IE��Ϊ1
MTC0 $3,$3	#���ж�

###################################################################
addi $s6,$zero,1       #�жϺ�1,2,3   ��ͬ�жϺ���ʾֵ��һ��

addi $s4,$zero,6      #ѭ��������ʼֵ  
addi $s5,$zero,1       #�������ۼ�ֵ
###################################################################
#                �߼����ƣ�ÿ����λ4λ 
# ��ʾ����������ʾ0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 ����ѭ��6��
###################################################################
Int_one_Loop:
add $s0,$zero,$s6   
Int_one_LeftShift:       
sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #di$splay $s0
addi   $v0,$0,34         # di$splay hex
syscall                 # we are out of here.   
bne $s0, $zero, Int_one_LeftShift
sub $s4,$s4,$s5      #ѭ�������ݼ�
bne $s4, $zero, Int_one_Loop
###################################################################

MTC0 $0,$3	#���ж�
#EPC��ջ$2
lw $2,0($sp)
addi $sp,$sp,4
MTC0 $2,$2	#$2�ָ�EPC
#�����ֳ�ջ$1
lw $1,0($sp)
addi $sp,$sp,4
MTC0 $1,$1	#$1�ָ�������

#32���Ĵ�����ջ
lw $25,0($sp)
addi $sp,$sp,4
lw $24,0($sp)
addi $sp,$sp,4
lw $23,0($sp)
addi $sp,$sp,4
lw $22,0($sp)
addi $sp,$sp,4
lw $21,0($sp)
addi $sp,$sp,4
lw $20,0($sp)
addi $sp,$sp,4
lw $19,0($sp)
addi $sp,$sp,4
lw $18,0($sp)
addi $sp,$sp,4
lw $17,0($sp)
addi $sp,$sp,4
lw $16,0($sp)
addi $sp,$sp,4
lw $15,0($sp)
addi $sp,$sp,4
lw $14,0($sp)
addi $sp,$sp,4
lw $13,0($sp)
addi $sp,$sp,4
lw $12,0($sp)
addi $sp,$sp,4
lw $11,0($sp)
addi $sp,$sp,4
lw $10,0($sp)
addi $sp,$sp,4
lw $9,0($sp)
addi $sp,$sp,4
lw $8,0($sp)
addi $sp,$sp,4
lw $7,0($sp)
addi $sp,$sp,4
lw $6,0($sp)
addi $sp,$sp,4
lw $5,0($sp)
addi $sp,$sp,4
lw $4,0($sp)
addi $sp,$sp,4
lw $3,0($sp)
addi $sp,$sp,4
lw $2,0($sp)
addi $sp,$sp,4
lw $1,0($sp)
addi $sp,$sp,4

ERET	#�жϷ���	
nop
nop
nop