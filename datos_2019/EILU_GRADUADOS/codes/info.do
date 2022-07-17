sort T_UNIV

by T_UNIV: summarize PR_SUELDO [aweight=FACTOR]

/* sueldo y tipo de universidad*/

tab PR_SUELDO [aweight=FACTOR]

tab T_UNIV PR_SUELDO [aweight=FACTOR], row nofreq

tab T_UNIV [aweight=FACTOR]

tab PR_SUELDO T_UNIV [aweight=FACTOR], col nofreq

tab PR_SUELDO T_UNIV [aweight=FACTOR], row nofreq

/*Situación de empleo*/

tab TRBPRN1 [aweight=FACTOR]

tab TRBPRN1 T_UNIV [aweight=FACTOR], col nofreq

/*Jornada*/

tab JORNADA [aweight=FACTOR]

tab JORNADA T_UNIV [aweight=FACTOR], col nofreq

/*ESTUDIOS PADRE*/

tab ESTUDIOS_PADRE [aweight=FACTOR]

tab ESTUDIOS_PADRE T_UNIV [aweight=FACTOR], col nofreq
