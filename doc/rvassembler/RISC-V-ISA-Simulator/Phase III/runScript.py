from stageFunctions import ProcessingUnit, State, BTB
from hazard import HDU
import sys
if len(sys.argv)==2:
	f_name=sys.argv[1]
else:
	raise Exception('Inavlid Arguments')


# States
# fetch_inp=State()
# decode_inp = State()
# execute_inp = State()
# ma_inp = State()
# wb_inp = State()
print_Final_register=True
print_Final_Mem=True
prediction_enabled=True
proc=ProcessingUnit(f'{f_name}',enable_prediction=prediction_enabled)
in_states=[State() for i in range(5)]
out_states=[]
master_PC=0
master_clock=0
stalling_enabled=False #Knob 2
print_regFile_for_each_ins=False #Knob 3
control_hazard = False
control_hazard_PC = 0
control_change = False
control_change_PC = 0
print_pipline_registers=False #Knob4
print_pipline_registers_for_specific=[False,-1] #Knob5
hdu = HDU()
btb = BTB()
count_branch_hazards=0
count_data_hazards=0
count_branch_hazards_stalls=0
count_data_hazards_stalls=0
print('Loaded program in Memory!')
while True:

	# Stalling with no forwarding
	if stalling_enabled:
		# print(f'Processing Instruction at {hex(state.PC)}')
		# IF_ID = proc.fetch(state)
		# # print(f'\tClock={state.clock} IR={hex(state.IR)} PC={hex(state.PC)}')	
		# if(state.IR==0):
		# 	break
		# ID_EX = proc.decode(IF_ID)
		# EX_MEM = proc.execute(ID_EX)
		# MEM_WB = proc.memory_access(EX_MEM)
		# state = proc.write_back(MEM_WB)_

		data_hazard=hdu.check_data_hazard_stalling(in_states)
		backup_states=in_states
		print(f'Cycle={master_clock} PC={master_PC}')
		# if data_hazard[0]==True :
			# out_states=out_states[1:] #removed the output of fetch state
			# in_states.append(out_states[0]) 
			# in_states.append(State())# inserted a buuble for execute state
			# in_states=in_states+out_states[1:]
		in_states=[(idx,val) for idx,val in enumerate(in_states)]
		reversed_states=in_states[::-1]
		for idx,state in reversed_states:
			if idx==0:
				control_change, control_change_PC, tempstate = proc.fetch(state, btb)
				out_states.append(tempstate)
			if idx==1:
				control_hazard, control_hazard_PC, tempstate = proc.decode(state, btb)
				out_states.append(tempstate)
			if idx==2:
				out_states.append(proc.execute(state))
			if idx==3:
				out_states.append(proc.memory_access(state))
			if idx==4:
				progress=proc.write_back(state)
		out_states=out_states[::-1]
		if stalling_enabled:
			if out_states[0].IR!=0 and (data_hazard[0]==False):
				master_PC +=4
		else:
			if out_states[0].IR!=0:
				master_PC+=4

		if(control_change and data_hazard[0]==False):
			master_PC = control_change_PC

		if(control_hazard and data_hazard[0]==False):
			count_branch_hazards+=1
			count_branch_hazards_stalls+=1
			master_PC = control_hazard_PC
			out_states[0] = State(0)
		elif(control_hazard and data_hazard[0] and prediction_enabled):
				btb.changeState(in_states[1].PC)
				
		if data_hazard[0]:
			count_data_hazards+=1
			count_data_hazards_stalls+=1
			out_states=[backup_states[1],State(0)]+out_states[2:]

	# For data forwarding
	else:
		print(f'Cycle={master_clock} PC={hex(master_PC)}')
		isHazard = False
		doStall = False
		stallWhere = 3
		forwarding_paths = set()
		# for s in in_states:
		# 	print("S", hex(s.IR))
		for i in reversed(range(5)):
			if i==0:
				control_change, control_change_PC, tempstate = proc.fetch(in_states[0], btb)
				out_states.append(tempstate)
				if print_pipline_registers_for_specific[0] and (print_pipline_registers_for_specific[1]*4-1)==(in_states[0].PC):
					print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')
			if i==1:
				# if master_clock == 5:
				# 	print("HELLO", in_states[1].rs1branch, hex(in_states[1].IR))
				control_hazard, control_hazard_PC, tempstate = proc.decode(in_states[1], btb)
				out_states.append(tempstate)
				if print_pipline_registers_for_specific[0] and (print_pipline_registers_for_specific[1]*4-1)==(in_states[0].PC):
					print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')
			if i==2:
				out_states.append(proc.execute(in_states[2]))
				if print_pipline_registers_for_specific[0] and (print_pipline_registers_for_specific[1]*4-1)==(in_states[0].PC):
					print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')
			if i==3:
				out_states.append(proc.memory_access(in_states[3]))
				if print_pipline_registers_for_specific[0] and (print_pipline_registers_for_specific[1]*4-1)==(in_states[0].PC):
					print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')
			if i==4:
				progress = proc.write_back(in_states[4])
				hazards = hdu.check_data_hazard(in_states)
				in_states[3] = hazards[2][3]
				forwarding_paths.update(hazards[4])
				if print_pipline_registers_for_specific[0] and (print_pipline_registers_for_specific[1]*4-1)==(in_states[0].PC):
					print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')


			if i<4:
				in_states[i] = out_states[-1]
				hazards = hdu.check_data_hazard(in_states)
				in_states = hazards[2]
				isHazard = isHazard | hazards[0]
				doStall = doStall | hazards[1]
				stallWhere = min(stallWhere, hazards[3])
				forwarding_paths.update(hazards[4])

		# print(doStall, stallWhere)
		if isHazard:
			count_data_hazards+=len(forwarding_paths)
		out_states=out_states[::-1]
		if out_states[0].IR!=0 and (doStall==False):
			master_PC +=4

		if(control_change and doStall==False):
			master_PC = control_change_PC

		if(control_hazard and doStall==False):
			count_branch_hazards+=1
			count_branch_hazards_stalls+=1
			master_PC = control_hazard_PC
			out_states[0] = State(0)
		elif (control_hazard and doStall and prediction_enabled):
				btb.changeState(in_states[1].PC)

		if doStall:
			# Stall at execute
			count_data_hazards_stalls+=1
			if stallWhere==1:
				out_states = [in_states[1], in_states[2], State()] + [out_states[3]]

			# Stall at decode
			else:
				out_states = [in_states[1], State()] + [out_states[2], out_states[3]]

	master_clock +=1
	if out_states[0].IR==0 and out_states[1].IR==0 and out_states[2].IR==0 and out_states[3].IR==0 and progress=="Completed":
		break
	if print_regFile_for_each_ins:
		print(f'Register File = {proc.RegisterFile}')
	if print_pipline_registers:
		print(f'E2E={hdu.E2E}, M2E={hdu.M2E}, E2D={hdu.E2D}, M2D={hdu.M2D}, M2M={hdu.M2M}')
	in_states=[State(master_PC)]
	in_states=in_states+out_states
	out_states=[]


# print(f'Total number of clock cycles used up ={master_clock}')
if print_Final_Mem:
	print('Final Memory:')
	print(proc.MEM)
if print_Final_register:
	print('Final Register:')
	print(proc.RegisterFile)

print(f'1. Total Number of Cycles= {master_clock}')
print(f'2. Total Instructions EXECUTED={proc.count_ins}')
cpi=master_clock/proc.count_ins
print(f'3. CPI={cpi:.4f}')
print(f'4. Number of Data_transfer (load and store) instructions EXECUTED= {proc.count_mem_ins}')
print(f'5. Number of ALU Instructions EXECUTED= {proc.count_ins-proc.count_control_ins-proc.count_mem_ins}')
print(f'6. Number of Control Instructions EXECUTED= {proc.count_control_ins}')
print(f'7. Number of Stalls in Pipline= {count_branch_hazards_stalls+count_data_hazards_stalls}')
print(f'8. Number of Data Hazards= {count_data_hazards}')
print(f'9. Number of Control Hazards= {count_branch_hazards}')
print(f'10. Number of Branch Mispredictions= {count_branch_hazards}')
print(f'11. Number of Stalls Due to Data Hazards= {count_data_hazards_stalls}')
print(f'12. Number of Stalls Due to Control Hazards= {count_branch_hazards_stalls}')
