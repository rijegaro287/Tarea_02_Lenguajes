:-include('diccionario.pl').
:-include('respuestas.pl').

analizarMensaje('Hola', 'Hola! En que le puedo ayudar?').

maceyAux:-
    write('Usuario: '),
    read(X), analizarMensaje(X, Y),
    write('MaCEy: '), write(Y),
    write('\n'),
    maceyAux. 


macey:- write('Bienvenido a MaCEy, digite su mensaje a continuacion. \n'),
    write('Usuario: '),
    read(X), analizarMensaje(X, Y),
    write('MaCEy: '), write(Y),
    write('\n'),
    maceyAux.



