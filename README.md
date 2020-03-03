# lab-riscv-asm

вариант 8

Вычислить скалярное произведение двух векторов. Передача по значению.

(N = 3, M = 2)

https://canvas.instructure.com/courses/1819197/assignments/13690542



int N[3]={11, 2, 34};
int M[2]={5, 1}
function int multvec(int n1, int n2, int n3, int m1, int m2){
return (n1*m1+n2*m2+n3*0);
}

int main(void) {
printf("Result is %d.", multvec(N[1], N[2], N[3], M[1], M[2]))
}
