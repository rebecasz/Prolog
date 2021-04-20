max(X, Y, X) :- X>Y, !.
max(_, Y, Y).

depth([],1).
depth([H|T],R):- atomic(H), !, depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, max(R3,R2,R).

append1([], L2, L2).
append1([H|T], L2, [H|CoadaR]) :- append1(T, L2, CoadaR).

flatten([],[]).
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append1(R1,R2,R).

heads([],[],_).
heads([H|T],[H|R],1):- atomic(H), !, heads(T,R,0).
heads([H|T],R,0):- atomic(H), !, heads(T,R,0).
heads([H|T],R,_):- heads(H,R1,1), heads(T,R2,0), append(R1,R2,R).
heads_pretty(L,R):- heads(L, R, 1).

member1(H,[H|_]).
member1(X,[H|_]):-member1(X,H).
member1(X,[_|T]):-member1(X,T).

member2(X,L):- flatten(L,L1), member(X,L1).

%EX 1
count_atomic([], 0).
count_atomic([H|T], R) :- atomic(H), !, count_atomic(T, R1), R is R1 +1.
count_atomic([_|T], R) :- count_atomic(T, R).

%EX2
sum_atomic([], 0).
sum_atomic([H|T], R) :- atomic(H), !, sum_atomic(T, R1), R is R1 + H.
sum_atomic([_|T], R) :- sum_atomic(T, R).

%EX3
member3(H,[H|_]):-!.
member3(X,[H|_]):-member3(X,H).
member3(X,[_|T]):-member3(X,T).
%%
member4(X,L):- flatten(L,L1), member(X,L1),!.



%EX5

%flatten([],[]).
%flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
%flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append1(R1,R2,R).

last_atomic([],[]).
%verific daca e ultimul elem din  lista -?
last_atomic([H|_] ,R):- atomic(H).
last_atomic([H|T],R):-atomic(H), !, last_atomic(T,R).
last_atomic([H|T],R):-last_atomic(H,R1), last_atomic(T,R2), append1(R1,R2,R).


%EX5
replace([], [], [], []).
replace(X, Y, [X|T], [Y|R]). 
replace(X, Y, [H|T], [H|R]). 


% EX6
delete1(_,[],[]).
delete1(H,[H|T],T).
delete1(X,[H|T],[H|R]):-delete1(X,T,R).

%dim lista-depth, adancime

minimD([H|T], M):-minimD(T, M),depth(M, R1),depth(H, R2),R1<R2,!.
minimD([H|_], H).

sort_depth(L, [M|R]):- minimD(L, M), delete1(M, L, L1), sort_depth(L1, R).
sort_depth([], []):- !.

















