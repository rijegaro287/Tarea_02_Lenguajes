:-include('reconocimiento.pl').
:-include('bnf.pl').

/*
    Recibe una oracion O de entrada. Si es valida, pasa a analizarMensaje y 
    escribe la respuesta obtenida R en la terminal de Prolog.
    Oracion: lista compuesta por palabras que el usuario ha escrito en la terminal
*/

verificar_bnf(O):-oracion(O,[]), analizarMensaje(O, R), write('MayCEy: '), write(R).

/*
    Recibe una oracion O de entrada. Si no es valida, escribe un mensaje indicando
    su invalidez en la terminal de Prolog.
    Oracion: lista compuesta por palabras que el usuario ha escrito en la terminal
*/

verificar_bnf(O):-not(oracion(O,[])), write('Mensaje invalido, intenta decirlo de una manera diferente.').

/*
    Continua la conversación con MayCEy. Recibe un string digitado por el usuario,
    lo convierte en una lista y verifica si es valido. Se llama a si misma.  
*/

maycey_aux:-
    %write('Usuario '),
    read(X),
    atomic_list_concat(L,' ', X),
    verificar_bnf(L),
    write('\n'),
    maycey_aux.

/*
    Inicia la conversación con MayCEy. Recibe un string digitado por el usuario,
    lo convierte en una lista y verifica si es valido. Pasa a macey_aux para iniciar
    la recursividad.  
*/

maycey:- 
    write('Bienvenido a MaCEy! digite su mensaje a continuacion: \n'),
    %write('Usuario: '),
    read(X),
    atomic_list_concat(L,' ', X),
    verificar_bnf(L),
    write('\n'),
    maycey_aux.