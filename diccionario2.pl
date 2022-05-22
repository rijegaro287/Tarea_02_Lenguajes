oracion(S0,S):-adverbio(S0, S1).
oracion(S0,S):-sintagma_nominal(S0,S1), sintagma_verbal(S1,S).

sintagma_nominal(S0,S):-pronombre(singular, S0, S1), sustantivo(S1,S). 
sintagma_nominal(S0,S):-articulo(singular, S0,S1), sustantivo(S1,S).

sintagma_verbal(S0,S):-raiz_verbo(S0,S).
sintagma_verbal(S0,S):-preposicion(S0,S1), sintagma_verbal(S1,S).
sintagma_verbal(S0,S):-raiz_verbo(S0,S1), sintagma_nominal(S1,S).
sintagma_verbal(S0,S):-raiz_verbo(S0,S1), preposicion(S1,S2), sustantivo(S2, S).

adverbio(S0,S):-afirmacion(S0,S).
adverbio(S0,S):-negacion(S0,S).
adverbio(S0,S):-lugar(S0,S).
adverbio(S0,S):-tiempo(S0,S).

% preposiciones
preposicion([de|S],S).
preposicion([para|S],S).
preposicion([por|S],S).
preposicion([en|S],S).
preposicion([hacia|S],S).
preposicion([sin|S],S).
preposicion([sobre|S],S).

% articulos
articulo(singular, [el|S],S).
articulo(singular, [la|S],S).
articulo(plural, [los|S],S).
articulo(plural, [las|S],S).

% pronombres
pronombre(singular, [este|S],S).
pronombre(singular, [esta|S],S).
pronombre(plural, [estos|S],S).
pronombre(plural, [estas|S],S).
pronombre(singular, [esto|S],S).
pronombre(singular, [mi|S],S).
pronombre(plural, [mis|S],S).
pronombre(singular, [su|S],S).
pronombre(plural, [sus|S],S).
pronombre(singular, [usted|S],S).
pronombre(singular, [yo|S],S).
pronombre(singular, [tu|S],S).

% conjunciones
conjuncion([y|S],S).
conjuncion([o|S],S).

% verbos
raiz_verbo([llam|S],S). % llamar
raiz_verbo([solicit|S],S). % solicitar
raiz_verbo([despeg|S],S). % despegar
raiz_verbo([aterri|S],S). % aterrizar
raiz_verbo([quier|S],S). % querer
raiz_verbo([quer|S],S). % querer
raiz_verbo([pued|S],S). % poder
raiz_verbo([pod|S],S). % poder
raiz_verbo([soy|S],S). % ser
raiz_verbo([disminu|S],S). % disminuir
raiz_verbo([perd|S],S). % perder
raiz_verbo([envi|S],S). % enviar
raiz_verbo([necesit|S],S). % necesito
raiz_verbo([est|S],S). % estar
raiz_verbo([entend|S],S). % entender
raiz_verbo([ten|S],S). % tener

% sustantivos
sustantivo([permiso|S],S).
sustantivo([equipo|S],S).
sustantivo([velocidad|S],S).
sustantivo([hora|S],S).
sustantivo([pista|S],S).
sustantivo([vuelo|S],S).
sustantivo([aerolinea|S],S).
sustantivo([matricula|S],S).
sustantivo([aeronave|S],S).
sustantivo([minutos|S],S).
sustantivo([horas|S],S).
sustantivo([segundos|S],S).
sustantivo([emergencia|S],S).
sustantivo([mayday|S],S).

% preguntas
pregunta([quien|S],S).
pregunta([como|S],S).
pregunta([cual|S],S).
pregunta([donde|S],S).
pregunta([que|S],S).
pregunta([porque|S],S).

% adverbios lugar
lugar([aqui|S],S).
lugar([alla|S],S).
lugar([aca|S],S).
lugar([ahi|S],S).

% adverbios tiempo
tiempo([ya|S],S).
tiempo([inmediato|S],S).
tiempo([nunca|S],S).
tiempo([hoy|S],S).
tiempo([pronto|S],S).

% adverbios afirmacion
afirmacion([ok|S],S).
afirmacion([si|S],S).
afirmacion([entendido|S],S).
afirmacion([bien|S],S).
afirmacion([correcto|S],S).
afirmacion([listo|S],S).
afirmacion([afirmativo|S],S).

% adverbios negacion
negacion([no|S],S).
negacion([tampoco|S],S).
negacion([negativo|S],S).

% saludos
saludo([hola|S],S).
saludo([buenas|S],S).
saludo([hey|S],S).
