%%EX1
%%( cmmmc  raportul dintre produsul lor și cmmdc)
cmmdc1(X,X,X). % parametrul 3 îi rezultatul la cmmdc
cmmdc1(X,Y,Z) :- X>Y, Diff is X-Y, cmmdc1(Diff,Y,Z).
cmmdc1(X,Y,Z) :- X<Y, Diff is Y-X, cmmdc1(X,Diff,Z).

cmmmc(X,Y,Rez):- cmmdc1(X,Y,Z) , Prod is X*Y , Rez is Prod/Z.

%%EX2   
%%ridicarea la putere
fact1(0,1).
fact1(N,F) :- N1 is N-1, fact1(N1,F1), F is N*F1.

power(X,0,1).
power(X,Y,Z):- Y1 is Y-1 , power(X ,Y1 ,Prod), Z is Prod*X.

fact2(0,Acc,F) :- F = Acc.
fact2(N,Acc,F) :- N > 0, N1 is N-1, Acc1 is Acc*N, fact2(N1,Acc1,F).
fact2(N,F) :- fact2(N,1,F). % acumulatorul este inițializat cu 1

%%ridicarea la putere -- cu acumulator

power2(X,0,Acc,R):- R=Acc.
power2(X,Y,Acc,R):- Y1 is Y-1, Acc1 is Acc*Y, power2(X, Y1, Acc1, R).
power2(X,Y,R):- power2(X,Y,1,R).


%%EX3
f(0,0).
f(1,1).
%%fib(n) = fib(n-1) + fib(n-2),
f(X,Rez) :-X1 is X-1 , X2 is X-2 , f(X1, Rez1) , f(X2,Rez2) , Rez is Rez1+Rez2.

%%EX4
%%Suma oricăror două laturi
%%trebuie să fie mai mare decât a treia latură
triangle(X,Y,Z):- Suma1 is X+Y , Suma1> Z,
    			  Suma2 is Y+Z , Suma2> X,
    			  Suma3 is X+Z , Suma3> Y.
%%EX5

%delta(A,B,C,Delta):- Delta is B*B-4*A*C .
solve(A,B,C,X):- D is B*B-4*A*C,D>=0, X is -B-sqrt(D)/(2*A).
solve(A,B,C,X):- D is B*B-4*A*C,D>=0, X is -B+sqrt(D)/(2*A).