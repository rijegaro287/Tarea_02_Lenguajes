:-include('diccionario.pl').

analizarMensaje('Hola', 'Hola!').
analizarMensaje(_, 'Me lo podrias repetir?').

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



