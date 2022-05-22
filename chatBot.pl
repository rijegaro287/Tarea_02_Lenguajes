:-include('diccionario2.pl').
%:-include('respuestas.pl').

bnf(O, R):-oracion(O,[]), analizarMensaje(O, R).
bnf(O):-not(oracion(O,[])), write('No he logrado comprender tu mensaje. Me lo podrias repetir?').

analizarMensaje([hola], 'Hola! En que te puedo ayudar?').
analizarMensaje(['si'], 'Entendido.').

maceyAux:-
    write('Usuario: '),
    read(X), 
    split_string(X, " ", ",", Y),
    write('Usted ha escrito: '),
    write(Y),
    write('\n'),
    %bnf(Y, Z),
    analizarMensaje(Y, R).
    write('MaCEy: '), write(R),
    write('\n'),
    maceyAux. 


macey:- write('Bienvenido a MaCEy! digite su mensaje a continuacion: \n'),
    maceyAux.



