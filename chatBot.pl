:-include('respuestas.pl').

bnf(O):-oracion(O,[]), analizarMensaje(O, R), write('MayCEy: '), write(R).
bnf(O):-not(oracion(O,[])), write('Mensaje invalido, intenta decirlo de una manera diferente.').

maycey_aux:-
    % write('Usuario '),
    read(X),
    % atomic_list_concat(L,' ', X),
    split_string(X, " ", ",", L),
    bnf(L),
    write('\n'),
    maycey_aux.

maycey:- 
    write('Bienvenido a MayCEy! digite su mensaje a continuacion: \n'),
    % write('Usuario: '),
    read(X),
    % atomic_list_concat(L,' ', X),
    split_string(X, " ", ",", L),
    bnf(L),
    write('\n'),
    maycey_aux.
