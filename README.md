# lab-riscv-asm

вариант 8

Вычислить скалярное произведение двух векторов. Передача по значению.

(N = 3, M = 2)

https://canvas.instructure.com/courses/1819197/assignments/13690542

C-code
```
int N[3]={11, 2, 34};
int M[2]={5, 1};
int multvec(int n1, int n2, int n3, int m1, int m2){
return (n1*m1+n2*m2+n3*0);
}

int main(void) { 
  int resa=0;
  resa=multvec(N[1], N[2], N[3], M[1], M[2]);
}
```

rv32I assembler code
```
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
```
