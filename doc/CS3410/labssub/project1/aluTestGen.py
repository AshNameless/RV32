import pandas as pd
import random

opbottom = -2**31
opup = 2**31 -1
num_each_op = 32 

insts = (("0001"), ("0101"), ("0011"), ("0111"), ("0010"), ("0000"), ("0100"), ("0110"), ("100x"), ("101x"), ("1110"), ("1111"))
test_vector = []
num = 1024

for non_shift_inst in insts[:-3]:
    _inst = non_shift_inst
    for i in range(0, num_each_op):
        if non_shift_inst == "100x":
            _inst = "100" + str(random.randint(0,1))
        row = [int(_inst, 2)]
        row.append(0)

        A = random.randint(opbottom, opup) 
        B = random.randint(opbottom, opup)
        C=0
        if non_shift_inst == "0001":
            C = A|B

        if non_shift_inst == "0101":
            C = ~(A|B)

        if non_shift_inst == "0011":
            C = A & B
            
        if non_shift_inst == "0111":
            C = A ^ B

        if non_shift_inst == "0010":
            if A == B:
                C = 1
            else:
                C = 0

        if non_shift_inst == "0000":
            if A != B:
                C = 1
            else:
                C = 0

        if non_shift_inst == "0100":
            if A < 0:
                C = 1
            else:
                C = 0

        if non_shift_inst == "0110":
            if A >= 0 :
                C = 1
            else:
                C = 0

        V = 0
        pattern = "0"*32+"1"*32
        if non_shift_inst == "100x":
            C = A+B
            if C > opup or C < opbottom:
                V = 1
            C = C & int(pattern, 2)
 

        if non_shift_inst == "110x":
            C = A-B
            if C > opup or C < opbottom:
                V = 1
            C = C & int(pattern, 2)
        
        row.append(A)
        row.append(B)
        row.append(C)
        row.append(V)
        test_vector.append(row)
        

for shift_inst in insts[-3:]:
    _inst = shift_inst
    for sa in range(0, 16): 
        for i in range(0, num_each_op):
            if shift_inst == "101x":
                _inst = "101" + str(random.randint(0,1))
            row = [int(_inst, 2)]
            A = random.randint(opbottom, opup) 
            B = random.randint(opbottom, opup)
            C = 0
        
            if shift_inst == "101x":
                pattern = "0"*32 + "1"* 32
                C = A << sa
                C = C & int(pattern, 2)
            if shift_inst == "1110":
                C = A >> sa
                pattern = "0"*(32+sa) + "1" * (32-sa)
                C = C & int(pattern, 2)
            if shift_inst == "1111":
                C = A >> sa

            row.append(sa)
            row.append(A)
            row.append(B)
            row.append(C)
            row.append(0)
            test_vector.append(row)
     
vector = pd.DataFrame(data=test_vector, columns=["op[4]", "Sa[5]", "A[32]", "B[32]", "C[32]", "V"])
vector.to_csv("alu_test_vector.txt", index=False, sep=" ")
