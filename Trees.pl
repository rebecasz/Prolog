tree1(t(6, t(4,t(2,nil,nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).

inorder(nil, []).
inorder(t(K,L,R), List):-inorder(L,LL), 
    					inorder(R,LR),
 						append(LL, [K|LR], List).

preorder(nil, []).
preorder(t(K,L,R), List):-preorder(L,LL), 
    					  preorder(R, LR),
						  append([K|LL], LR, List).

postorder(nil, []).
postorder(t(K,L,R), List):-postorder(L,LL), 
    					   postorder(R, LR),
						   append(LL, LR,R1), 
    					   append(R1, [K], List).

%EX1

append3([],[],L,L).
append3([],[H|T],L,[H|R]):- append3([],T,L,R).
append3([H|T],S,L,[H|R]):-append3(T,S,L,R).

tree3(t(6,t(4,t(2,nil,nil,nil),nil,t(7,nil,nil,nil)),t(5,nil,nil,nil), t(9,t(3, nil, nil,nil),nil,nil))).


inorder3(nil, []).
inorder3(t(K,L,M,R), List):-inorder3(L,LL), 
				            inorder3(M, LM), 
					        inorder3(R, LR),
					        append3(LL,LM,[K|LR],List).

preorder3(nil, []).
preorder3(t(K,L,M,R), List):-preorder3(L,LL),  
						     preorder3(M, LM),
							 preorder3(R, LR),
							 append3([K|LL], LM, LR, List).

postorder3(nil, []).
postorder3(t(K,L,M,R), List):-postorder3(L,LL), 
							  postorder3(M, LM),
							  postorder3(R, LR),
							  append3(LL, LM, LR, R1),
							  append(R1, [K], List).

%EX2

max(X, Y, X) :- X>Y, !.
max(_, Y, Y).

max3(X,Y,Z,X):- X>Y, X>Z.
max3(X,Y,Z,Y):- Y>X , X>Z, !.
max3(_,_,Z,Z).

height3(nil, 0).
height3(t(_, L,M, R), H):-height3(L, H1),
    				      height3(M,H2),
 					      height3(R, H3),
                          max3(H1, H2, H3, Hp),
                          H is Hp+1.


%EX4

frunza(nil,[]).
frunza(t(Key,nil,nil),[Key]).
frunza(t(Key,L,R),List):-frunza(L,L1),
				         frunza(R,L2),
					     append(L1,L2,List).

%EX5
%𝑑𝑖𝑎𝑚(𝑇) = max{𝑑𝑖𝑎𝑚(𝑇. 𝑙𝑒𝑓𝑡), 𝑑𝑖𝑎𝑚(𝑇. 𝑟𝑖𝑔ℎ𝑡), ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑙𝑒𝑓𝑡)+ ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑟𝑖𝑔ℎ𝑡) + 1}
height(nil, 0).
height(t(_, L, R), H):-height(L, H1),
 					   height(R, H2),
                       max(H1, H2, H3),
                       H is H3+1.


diam(nil,0).
diam(t(_,L,R),H):-diam(L,H1),
				  diam(R,H2),
			      height(L,H3),
				  height(R,H4),
				  Hp is H3+H4+1,
				  max3(H1,H2,Hp,H).



