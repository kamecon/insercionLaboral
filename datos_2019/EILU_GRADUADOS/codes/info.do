use "C:\Users\Kamal\Documents\InsercionLaboral\insercionLaboral\datos_2019\EILU_GRADUADOS\STATA\EILU_GRAD_2019.dta", clear

sort T_UNIV

by T_UNIV: summarize PR_SUELDO [aweight=FACTOR]

/* distribucion del sueldo, tipo de universidad y rama de estudio*/

tab PR_SUELDO [aweight=FACTOR]

tab T_UNIV [aweight=FACTOR]

tab RAMA [aweight=FACTOR]

/* sueldo y tipo de universidad*/

tab T_UNIV PR_SUELDO [aweight=FACTOR], row nofreq

tab PR_SUELDO T_UNIV [aweight=FACTOR], col nofreq

tab PR_SUELDO T_UNIV [aweight=FACTOR], row nofreq

/* sueldo y tipo de estudio*/

tab PR_SUELDO RAMA [aweight=FACTOR], col nofreq

tab PR_SUELDO RAMA [aweight=FACTOR], row nofreq

/* sexo y tipo de estudio*/

tab PR_SUELDO SEXO [aweight=FACTOR], col nofreq

tab SEXO PR_SUELDO [aweight=FACTOR], row nofreq

/*Situación de empleo*/

tab TRBPRN1 [aweight=FACTOR]

tab TRBPRN1 T_UNIV [aweight=FACTOR], col nofreq

tab TRBPRN1 RAMA [aweight=FACTOR], col nofreq

tab SEXO TRBPRN1 [aweight=FACTOR], row nofreq

/* Se hace uso en el trabajo actual de los conocimientos y habilidades
 adquiridos en estos estudios*/

tab TR_D21 [aweight=FACTOR]

tab TR_D21 T_UNIV [aweight=FACTOR], col nofreq

tab TR_D21 RAMA [aweight=FACTOR], col nofreq

tab SEXO TR_D21 [aweight=FACTOR], row nofreq
 
 
/*Jornada*/

tab JORNADA [aweight=FACTOR]

tab JORNADA T_UNIV [aweight=FACTOR], col nofreq

/*ESTUDIOS PADRE*/

tab ESTUDIOS_PADRE [aweight=FACTOR]

tab ESTUDIOS_PADRE T_UNIV [aweight=FACTOR], col nofreq
