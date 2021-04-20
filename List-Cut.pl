
union([], L, L).
union([H|T], L2, R) :- member(H, L2), !, union(T, L2, R).
union([H|T], L2, [H|R]) :- union(T, L2, R).

delete(X, [X|T], T) :- !.
delete(X, [H|T], [H|R]) :- delete(X, T, R).
delete(_, [], []).

%%EX1
inters([], _, []).
inters([H|T],L2,[H|R1]) :- member(H,L2) ,!, inters(T,L2,R1).
inters([_|T],L2,R) :-inters(T,L2,R).

%%EX2
diff([], _, []).
diff([H|T],L2,[H|R]) :- not(member(H,L2)) ,!, diff(T,L2,R).
diff([_|T],L2,R) :-diff(T,L2,R).

%%EX3
min1([H|T], M) :- min1(T, M), M<H, !.
min1([H|_], H).

max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).

delete_all(X, [X|T], R) :- delete_all(X, T, R). 
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).
delete_all(_, [], []).

del_min(L, R):- min1([H|T],R1),delete_all(R1,T,R). 
del_max(L, R):- max1([H|T],R1),delete_all(R1,T,R). 


%%EX4
reverse_list([],[]).
reverse_list([H|T],R) :- reverse_list(T,RezP),append(RezP,[H],R).

reverse_k(L, K ,R):-reverse_k(L,K,1,R).
reverse_k([H|T], K, K, [H|R]):- reverse_list(T, R).
reverse_k([H|T], X, K, [H|R]):- K=<X, Cont is K+1 ,reverse_k(T, X, Cont ,R).


