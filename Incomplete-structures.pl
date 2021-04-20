%%EX1
%1. Concatenează 2 liste incomplete

%append1([], L2, L2).
%append1([H|T], L2, [H|CoadaR]) :- append1(T, L2, CoadaR).

append1([],L2,L2):-var(L1),!,L2=[L1|_].
append1([H|T],L2,[H|CoadaR]):-append1(T,L2,CoadaR).


%EX3
%Convertește o listă incompletă într-o listă completă și viceversa.
completa_incompleta([],_):-!.
completa_incompleta([H|T],[H|L]):-completa_incompleta(T,L).
    
incompleta_completa([H|_],[]):-var(H), !.
incompleta_completa([H|T],[H|L]):-incompleta_completa(T,L).
    
%EX4
%Traversează un arbore incomplet în pre-ordine

tree2(t(7, t(5, t(3,_,_), t(6,_,_)), t(11,_,_))).

%preorder(nil, []).
%preorder(t(K,L,R), List):-preorder(L,LL), 
%    					  preorder(R, LR),
%						  append([K|LL], LR, List).

preordine(L, _) :- var(L),!.
preordine(t(K, L, R), List) :- preordine(L, LL), 
                               preordine(R, LR),
                               append1([K|LL], [LR|_], List).

%EX5
%. Calculează înălțimea unui arbore incomplet.

%height(nil, 0).
%height(t(_, L, R), H):-height(L, H1),
% 					   height(R, H2),
%                       max(H1, H2, H3),
%                       H is H3+1.

max(X, Y, X) :- X>Y, !.
max(_, Y, Y).

height1(T, 0) :- var(T), !.
height1(t(_ , L, R), H) :- height1(L, H1),
                           height1(R, H2),
                           max(H1, H2, H3), 
                           H is H3 +1.

%EX6
%Convertește un arbore incomplet într-un arbore complet și viceversa.

arbore_complet_incomplet(nil, _):-!.
arbore_complet_incomplet(t(K, L, R), t()) :- arbore_complet_incomplet().

arbore_incomplet_complet(T, []):- var(T), !.
arbore_incomplet_complet(t(K, L, R), t()) :-  arbore_incomplet_complet().
  

