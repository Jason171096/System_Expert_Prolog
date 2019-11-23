go:-
sugerencias(Disease),
write(Disease),
undo.

/*Hypothesis that should be tested*/
sugerencias(pantalla) :- pantalla, !.
sugerencias(botones) :- botones, !.
sugerencias(bateria) :- bateria, !.
sugerencias(audio) :- audio, !.
sugerencias(carga) :- carga, !.
sugerencias(audifonos) :- audifonos, !.
sugerencias(app) :- app, !.
sugerencias(camara) :- camara, !.
sugerencias(galeria) :- galeria, !.
sugerencias(memoria) :- memoria, !.
sugerencias(huella) :- huella, !.
sugerencias(vibracion) :- vibracion, !.
sugerencias(unknown). /* no diagnosis*/

/*Hypothesis Identification Rules*/

pantalla :-
verify(no_funciona_el_touch),
verify(pantalla_tiene_bordes_negros),
verify(pantalla_esta_rota),
verify(pantalla_no_enciende),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie la pantalla por una nueva'),
nl.

botones :-
verify(botones_fragiles),
verify(pantalla_no_enciende),
verify(botones_estan_salidos),
verify(botones_dañados),
verify(no_tiene_botones),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie los botones'),
nl.

bateria :-
verify(no_carga),
verify(bateria_inflada),
verify(bateria_caliente),
verify(bateria_inchada),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie la bateria por una nueva'),
nl.

audio :-
verify(no_se_escucha),
verify(no_reproduce_cancion),
verify(tiene_tapado_la_bocina),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie el puerto de salida de audio'),
nl.

carga :-
verify(carga_lenta),
verify(no_carga),
verify(carga_pero_no_pasa_su_porcentaje),
verify(),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie el puerto de carga'),
nl.

audifonos :-
verify(no_se_escucha),
verify(no_reproduce_cancion),
verify(puerto_dañado),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie la entrada de audifonos'),
nl.

app :-
verify(no_abre_app),
verify(da_error),
verify(le_manda_reporte),
write('Sugerencias:'),
nl,
write('Recomendaciones es que reinicie el telefono y se descargue de nuevo la app'),
nl.

camara :-
verify(no_abre_app),
verify(no_abre_camara),
verify(no_graba),
verify(no_toma_fotos),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie la camara'),
nl.

galeria :-
verify(no_abre_app),
verify(no_abre_imagenes),
verify(da_error),
write('Sugerencias:'),
nl,
write('Recomendaciones es que reinicie el telefono y pruebe de nuevo a entrar a galeria'),
nl.

memoria :-
verify(no_abre_app),
verify(saturada_memoria),
verify(da_error),
write('Sugerencias:'),
nl,
write('Recomendaciones es que desinstale apps basura'),
nl.

huella :-
verify(pantalla_no_enciende),
verify(no_reconoce_huella),
verify(no_vibra),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie el sensor de huella'),
nl.

vibracion :-
verify(no_vibra),
verify(no_hace_zumbidos),
verify(no_vibra_al_momento_de_notificacion),
write('Sugerencias:'),
nl,
write('Recomendaciones es que cambie el sensor de vibracion'),
nl.

/* how to ask questions */
ask(Question) :-
write('Que problemas presenta tu celular: '),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
