member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

append1([], L2, L2).
append1([H|T], L2, [H|CoadaR]) :- append1(T, L2, CoadaR).

delete(X, [X|T], T).
delete(X, [H|T], [H|R]) :- delete(X, T, R).
delete(_, [], []). 

delete_all(X, [X|T], R) :- delete_all(X, T, R). 
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).
delete_all(_, [], []).


%EX1
append3(L1,L2,L3,Result) :- append(L1,L2,Temp), append(Temp,L3,Result). 

%EX2
%add first
add_first(X,L,R) :-append1(X,L,R).
%add last
add_last(L,X,R) :- append1(L, X , R).

%EX3
%sum elements
sum_elem([],0).
sum_elem([H|T],SumaTotala):-sum_elem(T,SumaPartiala), SumaTotala is H + SumaPartiala.

%EX4 
%separate_parity(L, E, O).
%separate_parity([1, 2, 3, 4, 5, 6], E, O).
par(X) :- 0 is mod(X, 2).
impar(X) :- 1 is mod(X, 2).

separate_parity([],[],[]).
separate_parity([H|T], X, [H|Y]):- 1 is H mod 2, separate_parity(T,X,Y).
separate_parity([H|T], [H|X], Y):- 0 is H mod 2, separate_parity(T,X,Y).

%EX5 
%delete duplicates
%remove_duplicates([3, 4, 5, 3, 2, 4], R).

remove_duplicates([],[]).
remove_duplicates([H | T], List) :- member(H, T),remove_duplicates( T, List).
remove_duplicates([H | T], [H|T1]) :- \+member(H, T),remove_duplicates( T, T1).



