add2(X, LS, LE, RS, RE):- RS = LS, LE = [X|RE].

append_dl(LS1,LE1, LS2,LE2, RS,RE):- RS=LS1, LE1=LS2, RE=LE2.

inorder_dl(nil,L,L).
inorder_dl(t(K,L,R),LS,LE):-
inorder_dl(L,LSL,LEL), 
inorder_dl(R,LSR,LER), 
LS=LSL,
LEL=[K|LSR],
LE=LER.

quicksort_dl([H|T], S, E):- 
partition(H, T, Sm, Lg), 
quicksort_dl(Sm, S, [H|L]),
quicksort_dl(Lg, L, E).
quicksort_dl([], L, L). 

:-dynamic memo_fib/2.

fib(N,F):- memo_fib(N,F), !.
fib(N,F):- N>1,
N1 is N-1,
N2 is N-2,
fib(N1,F1),
fib(N2,F2),
F is F1+F2,
assertz(memo_fib(N,F)).
fib(0,1).
fib(1,1).

print_all:-memo_fib(N,F),
write(N),
write(' – '),
write(F),
nl,
fail.
print_all.

all_perm(L,_):- perm(L,L1), 
assertz(p(L1)),
fail.
all_perm(_,R):- collect_perms(R).



collect_perms([L1|R]):- retract(p(L1)), !, collect_perms(R).
collect_perms([]).



%ex1
%lista incompleta --> lista diferenta
incompleta_diferenta([H|T], L, L) :- var(H), !.
incompleta_diferenta([H|T], [H|LS], LE) :- incompleta_diferenta(T, LS, LE).

%lista incompleta <-- lista diferenta
diferenta_incompleta(L, L, _) :-var(L),!.
diferenta_incompleta([H|LS], LE, [H|Lis]) :- diferenta_incompleta(LS, LE, Lis).

%ex2
%lista completa --> lista diferenta
completa_diferenta([], L, L):-!.
completa_diferenta([H|T], [H|LS], LE) :- completa_diferenta(T, LS, LE).

%lista completa <-- lista diferenta
diferenta_completa(L, L, []) :- var(L), !.
diferenta_completa([H|LS], LE, [H|L]) :- diferenta_completa(LS, LE, L).

%EX3
%Generează toate descompunerile posibile a unei liste în doua sub-liste
:-dynamic p/1.
all_decompositions(L, _) :- append(X, Y, L), 
                            asserta(p([X, Y])), 
                            fail.
all_decompositions(_, R):- collect_all(R).

collect_all([L1|R]) :- retract(p(L1)), !, collect_all(R).
collect_all([]).

%EX4
%flatten([],[]).
%flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
%flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append1(R1,R2,R).

% flat_dl([[1], 2, [3, [4, 5]]], RS, RE)
flat_dl([], L, L).
flat_dl([H|T], [H|RS], RE) :- atomic(H), !, flat_dl(T, RS, RE).
flat_dl([H|T], RS, RE) :- flat_dl(H, RS1, RE1), flat_dl(T, RS2, RE2), RS = RS1, RE1 = RS2 , RE2=RE.


%EX5
%Colectează toate nodurile care au chei pare,
% ??
even_key(nil, L, L).
even_key(t(K, L, R), LS, LE) :- even_key(L, LSL, LEL), 
    							even_key(R, LSR, LER), 
    							Key is K mod 2, 
    					    	Key = 0, 
    							LS= LSL, 
    				    		LEL = LER.











