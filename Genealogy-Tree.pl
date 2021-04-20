% Predicatul woman/1
woman(ana).
woman(sara).
woman(ema).
woman(maria). 
woman(dorina).
woman(irina).
woman(carmen).
% Predicatul man/1
man(andrei).
man(george).
man(alex).
man(sergiu).
man(marius).
man(mihai).

% Predicatul parent/2
parent(maria, ana). % maria este părintele anei
parent(george, ana). % george este părintele anei

parent(maria, andrei).
parent(george, andrei).

parent(sergiu, mihai).

parent(marius, maria).
parent(dorina, maria).

parent(mihai, george).
parent(irina, george).

parent(maria, andrei).
parent(george, andrei).

parent(mihai, carmen).
parent(irina, carmen).

parent(carmen, sara).
parent(alex, sara).

parent(carmen, ema).
parent(alex, ema).
% Predicatul mother/2
mother(X,Y) :- woman(X), parent(X,Y).
% X este mama lui Y, daca X este femeie și X este părintele lui Y

% Predicatul father/2
father(X,Y) :- man(X), parent(X,Y).

% Predicatul sibling/2
% X și Y sunt frați/surori dacă au același parinte și X diferit de Y
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\=Y.

% Predicatul sister/2
% X este sora lui Y dacă X este femeie și X și Y sunt frați/surori
sister(X,Y) :- sibling(X,Y), woman(X).

% Predicatul aunt/2
% X este mătușa lui Y daca este sora lui Z și Z este părintele lui Y
aunt(X,Y) :- sister(X,Z), parent(Z,Y).

% Predicatul brother/2
brother(X,Y) :- sibling(X,Y), man(X).

% Predicatul uncle/2
uncle(X,Y) :- brother(X,Z), parent(Z,Y).

grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
grandfather(X,Y) :- parent(X,Z), parent(Z,Y), man(X).

ancestor(X,Y) :- parent(X,Z), parent(Z,Y).

ancestor1(X,Z) :- parent(X,Y), parent(Y,U), parent(U,Z).

anc_rec(X, Y) :-parent(X,Y).
anc_rec(X, Y) :- parent(X, Z),
                 anc_rec(Z, Y).