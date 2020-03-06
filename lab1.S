# task initialization 
addi t0 x0 2 # N1
addi t1 x0 5 # N2
addi t2 x0 4 # N3
addi t3 x0 2 # M1
addi t4 x0 2 # M2
add a0 t0 zero # function preparation
add a1 t1 zero
add a2 t2 zero
add a3 t3 zero
add a4 t4 zero
j multvec
multvec:
add t0 zero zero
add t1 zero zero
add t2 zero zero

Loop1: # mult t0 a0 a3
  beq a0, zero, Endloop1
  addi a0, a0, -1
  add t0, a3, t0
  j Loop1
Endloop1:

Loop2: # mult t1 a1 a4
  beq a1, zero, Endloop2
  addi a1, a1, -1
  add t1, a4, t1
  j Loop2
Endloop2:

Loop3: # mult t2 a2 zero
  beq a2, zero, Endloop3
  addi a2, a2, -1
  add t2, zero, t2
  j Loop3
Endloop3:

add a1 t0 zero
add a1 t1 a1
add a1 t2 a1

j endmultvec
endmultvec:
addi a0 zero 1
ecall