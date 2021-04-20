%% sortarea prin permutari
perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

is_ordered([H1, H2|T]):-H1 =< H2, is_ordered([H2|T]).
is_ordered([_]). % daca ii doar un element ii deja ordonata

perm_sort(L,R):-perm(L, R), is_ordered(R), !.

%%selection sort

min1([H|T], M) :- min1(T, M), M<H, !.
min1([H|_], H).

delete(X, [X|T], T) :- !.
delete(X, [H|T], [H|R]) :- delete(X, T, R).
delete(_, [], []).

sel_sort(L, [M|R]):- min1(L, M), delete(M, L, L1), sel_sort(L1, R).
sel_sort([], []).

%%insertion sort
ins_sort([H|T], R):- ins_sort(T, R1), insert_ord(H, R1, R).
ins_sort([], []).

insert_ord(X, [H|T], [H|R]):-X>H, !, insert_ord(X, T, R).
insert_ord(X, T, [X|T]).

%%bubble sort
bubble_sort(L,R):-one_pass(L,R1,F), nonvar(F), !, bubble_sort(R1,R).
bubble_sort(L,L).

one_pass([H1,H2|T], [H2|R], F):-H1>H2, !, F=1, one_pass([H1|T],R,F).
one_pass([H1|T], [H1|R], F):-one_pass(T, R, F).
one_pass([], [] ,_).

%%quick sort
quick_sort([H|T], R):-partition(H, T, Sm, Lg),
					  quick_sort(Sm, SmS), 
					  quick_sort(Lg, LgS),
					  append(SmS, [H|LgS], R).
quick_sort([], []).

partition(H, [X|T], [X|Sm], Lg):-X<H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]):-partition(H, T, Sm, Lg).
partition(_, [], [], []).

%%merge sort
merge_sort(L, R):-split(L, L1, L2), % împarte L în doua subliste de lungimi egale
				merge_sort(L1, R1),
				merge_sort(L2, R2),
				merge(R1, R2, R). % interclasează sublistele ordonate
merge_sort([H], [H]). % split returnează fail dacă lista ii vidă sau are doar un singur element
merge_sort([], []).

split(L, L1, L2):-length(L, Len),Len>1,K is Len/2,splitK(L, K, L1, L2).

splitK([H|T], K, [H|L1], L2):-K>0,!,K1 is K-1,splitK(T, K1, L1, L2).
splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]):-H1<H2, !, merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]):-merge([H1|T1], T2, R).
merge([], L, L).
merge(L, [], L).

%%EX1: Rescrieți predicatul perm fără a apela predicatul append.

member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

delete1(X, [X|T], T).
delete1(X, [H|T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []). 

perm2(L, [H|R]):-member1([H|T], L), delete1(A, T, L1), perm2(L1, R).
perm2([], []).

is_ordered2([H1, H2|T]):-H1 =< H2, is_ordered2([H2|T]).
is_ordered2([_]). % daca ii doar un element ii deja ordonata

perm_sort2(L,R):-perm2(L, R), is_ordered2(R), !.

%%EX2: Rescrieți predicatul sel_sort astfel încât să sorteze descrescător.

max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).



sel_sort2(L, [M|R]):- max1(L, M), delete1(M, L, L1), sel_sort2(L1, R).
sel_sort2([], []).


%%EX3: Scrieți un predicat care să sorteze o listă de caractere ASCII.
% char_code
% sort_chars([e, t, a, v, f], L).

caract_min([H|T], M) :- caract_min(T, M), caract_min(M, H1), char_code(H, H2), H1<H2, !.
caract_min([H|_], H).

sort_chars(L, [M|R]):- caract_min(L, M), delete1(M, L, L1), sort_chars(L1, R).
sort_chars([], []):- !.

%%EX4:Scrieți un predicat care să sorteze o lista de sub-liste în funcție de
%lungimea sub-listelor.
%sort_len([[a, b, c], [f], [2, 3, 1, 2], [], [4, 4]], R).


dimensiuneLista([], LenResult):-LenResult is 0.
dimensiuneLista([_|Y], LenResult):- dimensiuneLista(Y, L),LenResult is L + 1.

minimL([H|T], M) :- minimL(T, M), dimensiuneLista(M, R1), dimensiuneLista(H, R2), R1<R2, !.
minimL([H|_], H).

%% cu selection sort
sort_len(L, [M|R]):- minimL(L, M), delete1(M, L, L1), sort_len(L1, R).
sort_len([], []):- !.

%% cu permuatation sort ??? 

sort_len2(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), sort_len2(L1, R).
sort_len2([], []).

is_ordered([H1, H2|T]):-dimesiuneLista(H1,T) =< dimesiuneLista(H2,T), is_ordered([H2|T]).
is_ordered([_]).










