/**********************************************************************************************************************					
Instituto Nacional de Estad�stica (INE) www.ine.es					
***********************************************************************************************************************					
					
DESCRIPCI�N:					
Este programa genera un fichero SAS con formatos, partiendo de un fichero sin ellos.					
					
Consta de las siguientes partes:					
	* 1. Definir la librer�a de trabajo --> Libname				
	* 2. Definici�n de formatos --> PROC FORMAT				
	* 3. Vincular formatos a la base de datos --> PASO data				
					
 Entrada:                                                           					
     - Fichero SAS sin formatos: 	 EILU_GRAD_2019.sas7bdat				
 Salida:                                                           					
     - Fichero SAS con formatos: 	 EILU_GRAD_2019_conFormato.sas7bdat				
					
Donde:					
	* Operaci�n: Encuesta de Inserci�n Laboral de Titulados Universitarios. Graduados universitarios (EILU_GRAD)				
	* Periodo: 2019				
					
************************************************************************************************************************/					
					
/*1) Definir la librer�a de trabajo: introducir el directorio que desee como librer�a					
(se da como ejemplo 'C:\Mis resultados'), y copiar en ese directorio el fichero sas "EILU_GRAD_2019.sas7bdat"*/					
					
libname ROutput 'C:\Mis resultados';					

options fmtsearch = (ROutput ROutput.cat1);

* 2) DEFINICI�N DE FORMATOS;
PROC FORMAT LIBRARY=ROutput.cat1;
value $TSEXO

"1"="Hombre"
"2"="Mujer"
;
value $TEDAD

"1"="Menores de 30 a�os"
"2"="De 30 a 34 a�os"
"3"="De 35 y m�s a�os"
;
value $TNACIO

"1"="Espa�ola"
"2"="Espa�ola y otra"
"3"="Otra nacionalidad"
;
value $TNACIOP

"1"="Un pa�s de la UE"
"2"="Un pa�s fuera de la UE"
"9"="NS/NC"
" "="No aplicable"
;
value $TNACIP

"1"="Espa�a"
"2"="Otro pa�s de la UE"
"3"="Otro pa�s fuera de la UE"
"9"="NS/NC"
;
value $TRAMA

"1"="Artes y humanidades"
"2"="Ciencias"
"3"="Ciencias sociales y jur�dicas"
"4"="Ingenier�a y arquitectura"
"5"="Ciencias de la salud"
;
value $TAMBITO

"0112"="Formaci�n de docentes de ense�anza infantil"
"0113"="Formaci�n de docentes de ense�anza primaria"
"011"="Educaci�n (Otros estudios)"
"0211"="T�cnicas audiovisuales y medios de comunicaci�n"
"021"="Artes (Otros estudios)"
"022"="Humanidades"
"023"="Lenguas"
"0311"="Econom�a"
"0313"="Psicolog�a"
"031"="Ciencias sociales y del comportamiento (Otros estudios)"
"032"="Periodismo y documentaci�n"
"0413"="Direcci�n y administraci�n"
"041"="Negocios y administraci�n (Otros estudios)"
"042"="Derecho"
"051"="Ciencias de la vida"
"052"="Medio ambiente"
"053"="Ciencias qu�micas, f�sicas y geol�gicas"
"054"="Matem�ticas y estad�stica"
"061"="Inform�tica"
"071"="Ingenier�a y profesiones afines"
"072"="Industria manufacturera y producci�n"
"073"="Arquitectura y construcci�n"
"081"="Agricultura y ganader�a"
"082"="Silvicultura"
"084"="Veterinaria"
"0912"="Medicina"
"0913"="Enfermer�a"
"091"="Salud (Otros estudios)"
"092"="Servicios sociales"
"1014"="Actividades f�sicas y deportivas"
"1015"="Viajes, turismo y ocio"
"109"="Servicios (Otros estudios)"
"9999"="NS/NC"
"    "="No aplicable"
;
value $TTPUNIV

"1"="Universidad P�blica presencial"
"2"="Universidad P�blica a distancia"
"3"="Universidad Privada presencial"
"4"="Universidad Privada a distancia"
;
value $T1SINO

"1"="S�"
"2"="No"
;
value $TPROXY

"1"="Entrevista directa con la persona seleccionada"
"2"="Entrevista proxy"
;
value $T1PAIS

"01"="Espa�a"
"02"="Reino Unido"
"03"="Alemania"
"04"="Francia"
"05"="Otro pa�s de la Uni�n Europea"
"06"="Otro pa�s europeo (fuera de la UE)"
"07"="Un pa�s de Am�rica del Norte"
"08"="Un pa�s de Am�rica Central o Am�rica del Sur"
"09"="Un pa�s de Asia"
"10"="Un pa�s de �frica"
"11"="Un pa�s de Ocean�a"
"99"="NS/NC"
"  "="No aplicable"
;
value $TNFORMA

"1"="No sabe leer o escribir"
"2"="Educaci�n primaria incompleta (ha asistido menos de 5 a�os a la escuela)"
"3"="Educaci�n primaria completa"
"4"="Primera etapa de Ense�anza Secundaria, con o sin t�tulo (ESO, EGB, Bachillerato Elemental)"
"5"="Estudios de Bachillerato (Bachillerato LOGSE, BUP, COU, Preu)"
"6"="Ense�anzas profesionales de grado medio o equivalentes"
"7"="Ense�anzas profesionales de grado superior o equivalentes"
"8"="Estudios universitarios (Diplomatura, Licenciatura, Doctorado) o equivalentes"
"9"="NS/NC"
;
value $T2SINO

"1"="S�"
"2"="No"
"9"="NS/NC"
" "="No aplicable"
;
value $T2ESTM

"1"="Programa Erasmus"
"2"="Otros programas o becas dentro de la UE"
"3"="Otros programas o becas fuera de la UE"
"9"="NS/NC"
" "="No aplicable"
;
value $T2PAIS

"01"="Reino Unido"
"02"="Alemania"
"03"="Francia"
"04"="Italia"
"05"="Portugal"
"06"="Pa�ses N�rdicos (Suecia, Noruega, Finlandia, Dinamarca e Islandia)"
"07"="Otro pa�s de la Uni�n Europea"
"08"="Otro pa�s europeo"
"11"="Un pa�s de Am�rica del Norte"
"12"="Un pa�s de Am�rica Central o Am�rica del Sur"
"21"="Un pa�s de Asia"
"31"="Un pa�s de �frica"
"41"="Un pa�s de Ocean�a"
"99"="NS/NC"
"  "="No aplicable"
;
value $T4ESTM

"1"="De 1 a 3 meses"
"2"="De 4 a 6 meses"
"3"="De 7 a 9 meses"
"4"="De 10 a 12 meses"
"5"="M�s de un a�o"
"9"="NS/NC"
" "="No aplicable"
;
value $TMOTEST

"1"="Formarse pensando en su futuro laboral"
"2"="Ampliar conocimientos por satisfacci�n personal"
"3"="Otros motivos"
"9"="NS/NC"
;
value $TNUMEST

"1"="Uno"
"2"="Dos"
"3"="Tres o m�s"
" "="No aplicable"
;
value $TESTMMN

"1"="Antes de comenzar los estudios de la titulaci�n que finaliz� en 2014"
"2"="Durante la realizaci�n de los estudios de la titulaci�n que finaliz� en 2014"
"3"="Despu�s de obtener la titulaci�n que finaliz� en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $TESTEXT

"1"="Completamente en Espa�a"
"2"="Una parte en Espa�a y otra parte en el extranjero"
"3"="Completamente en el extranjero"
"9"="NS/NC"
" "="No aplicable"
;
value $TFAMIGS

"01"="Agraria"
"02"="Mar�timo-pesquera"
"03"="Industrias alimentarias"
"04"="Qu�mica"
"05"="Imagen personal"
"06"="Sanidad"
"07"="Seguridad y medio ambiente"
"08"="Fabricaci�n mec�nica"
"09"="Instalaci�n y mantenimiento"
"10"="Electricidad y electr�nica"
"11"="Energ�a y agua"
"12"="Transporte y mantenimiento de veh�culos"
"14"="Edificaci�n y obra civil"
"15"="Vidrio y cer�mica"
"16"="Madera, mueble y corcho"
"17"="Textil, confecci�n y piel"
"18"="Artes gr�ficas"
"19"="Imagen y sonido"
"20"="Inform�tica y comunicaciones"
"21"="Administraci�n y gesti�n"
"22"="Comercio y marketing"
"23"="Servicios socioculturales y a la comunidad"
"24"="Hosteler�a y turismo"
"25"="Actividades f�sicas y deportivas (incluidas ense�anzas deportivas de grado superior)"
"26"="Artes y artesan�as"
"88"="Estudios art�sticos superiores (artes pl�sticas, dise�o, m�sica y danza, arte dram�tico o conservaci�n y restauraci�n de bienes culturales)"
"99"="NS/NC"
"  "="No aplicable"
;
value $TFAMIGM

"01"="Agraria"
"02"="Mar�timo-pesquera"
"03"="Industrias alimentarias"
"04"="Qu�mica"
"05"="Imagen personal"
"06"="Sanidad"
"07"="Seguridad y medio ambiente"
"08"="Fabricaci�n mec�nica"
"09"="Instalaci�n y mantenimiento"
"10"="Electricidad y electr�nica"
"11"="Energ�a y agua"
"12"="Transporte y mantenimiento de veh�culos"
"13"="Industrias extractivas"
"14"="Edificaci�n y obra civil"
"15"="Vidrio y cer�mica"
"16"="Madera, mueble y corcho"
"17"="Textil, confecci�n y piel"
"18"="Artes gr�ficas"
"19"="Imagen y sonido"
"20"="Inform�tica y comunicaciones"
"21"="Administraci�n y gesti�n"
"22"="Comercio y marketing"
"23"="Servicios socioculturales y a la comunidad"
"24"="Hosteler�a y turismo"
"25"="Actividades f�sicas y deportivas (incluidas ense�anzas deportivas de grado medio)"
"88"="Ense�anzas art�sticas profesionales"
"99"="NS/NC"
"  "="No aplicable"
;
value $TESTSNT

"1"="S�, ya ha completado esa formaci�n"
"2"="S�, esta realizando el MIR o EIR o FIR o PIR, � etc"
"3"="No, pero est� preparando el examen de acceso"
"4"="No"
"9"="NS/NC"
" "="No aplicable (Titulaci�n no sanitaria)"
;
value $TESTCRS

"01"="Grado universitario de 180 cr�ditos (3 a�os)"
"02"="Grado universitario de 240 cr�ditos (4 a�os)"
"03"="Grado universitario de m�s de 240 cr�ditos (5 a�os o m�s)"
"04"="M�ster universitario"
"05"="Doctorado universitario"
"06"="Estudios art�sticos superiores (artes pl�sticas, dise�o, m�sica y danza, arte dram�tico o conservaci�n y restauraci�n de bienes culturales)"
"07"="Ciclos Formativos de grado superior (formaci�n profesional, artes pl�sticas y dise�o) o Ense�anzas Deportivas de Grado Superior"
"08"="Ciclos Formativos de grado medio (formaci�n profesional, artes pl�sticas y dise�o) o Ense�anzas Deportivas de Grado Medio"
"09"="No estoy cursando ninguno de los estudios anteriores"
"99"="NS/NC"
;
value $Tidioma

"01"="Espa�ol"
"02"="Catal�n"
"03"="Euskera"
"04"="Gallego"
"05"="Valenciano"
"06"="Ingl�s"
"07"="Franc�s"
"08"="Alem�n"
"09"="Italiano"
"10"="Portugu�s"
"11"="Rumano"
"12"="�rabe"
"13"="Chino"
"14"="Ruso"
"15"="Otros idiomas"
"99"="NS/NC"
"  "="No aplicable"
;
value $TNUMIDI

"0"="Ninguno"
"1"="1"
"2"="2"
"3"="3"
"4"="4"
"5"="5 o m�s"
"9"="NS/NC"
;
value $TNivIdi

"1"="Nivel alto (Entiende una gran variedad de textos complicados y usa el idioma con flexibilidad)"
"2"="Nivel medio (Entiende lo esencial en el lenguaje com�n y redacta textos sencillos)"
"3"="Nivel bajo (Entiende y usa las expresiones m�s comunes )"
"9"="NS/NC"
" "="No aplicable"
;
value $TIPACRE

"1"="A1 (DELF A1, Fit in Deutsch 1, �.)"
"2"="A2 (DELF A2, Fit in Deutsch 2, �)"
"3"="B1 (PET, DELF B1, ZD, �)"
"4"="B2 (FCE, DELF B2, ZDfB, �)"
"5"="C1 (CAE, DALF C1, PWD, �)"
"6"="C2 (CPE, DALF C2, ZOP, �)"
"9"="NS/NC"
" "="No aplicable"
;
value $TTIC

"1"="Usuario de nivel b�sico (navegar por internet, enviar correos electr�nicos, copiar o mover archivos o carpetas, escribir un texto usando un procesador de textos, usar f�rmulas simples en hojas de c�lculo)"
"2"="Usuario de nivel intermedio (dar formato a textos, usar f�rmulas m�s avanzadas y crear gr�ficos en hojas de c�lculo, instalar dispositivos y/o programas, usar bases de datos)"
"3"="Usuario de nivel avanzado (escribir macros, programar, resolver problemas de software y hardware cuando el ordenador no funciona adecuadamente)"
"9"="NS/NC"
;
value $TPAIMOV

"01"="Reino Unido"
"02"="Alemania"
"03"="Francia"
"07"="Otro pa�s de la Uni�n Europea"
"08"="Otro pa�s europeo"
"11"="Un pa�s de Am�rica del Norte"
"12"="Un pa�s de Am�rica Central o Am�rica del Sur"
"21"="Un pa�s de Asia"
"31"="Un pa�s de �frica"
"41"="Un pa�s de Ocean�a"
"88"="No ha residido en ning�n otro pa�s"
"99"="NS/NC"
"  "="No aplicable"
;
value $TVIVIRF

"1"="S�, ya lo ha decidido y se va a ir en los pr�ximos meses"
"2"="S�, se lo ha planteado y se ir�a a vivir fuera de Espa�a"
"3"="S�, se lo ha planteado pero ha decidido quedarse a vivir en Espa�a"
"4"="No, no se lo ha planteado"
"9"="NS/NC"
" "="No aplicable"
;
value $T1TRBPN

"1"="Trabajando"
"2"="En desempleo"
"3"="Inactivo"
;
value $T2TRBPN

"1"="Estudiante (estudiante o preparando oposiciones)"
"2"="Jubilado"
"3"="Incapacitado para trabajar"
"4"="Dedicado a las labores del hogar"
"5"="Otra situaci�n"
"9"="NS/NC"
" "="No aplicable"
;
value $T1MOBUT

"1"="Antes de acabar los estudios de la titulaci�n que finaliz� en 2014"
"2"="Despu�s de acabar los estudios de la titulaci�n que finaliz� en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $T1TIEMP

"1"="Menos de tres meses"
"2"="De 3 a 6 meses"
"3"="De 6 meses a 1 a�o"
"4"="De 1 a�o a a�o y medio"
"5"="De 1 a�o y medio a 2 a�os"
"6"="2 � m�s a�os"
"9"="NS/NC"
" "="No aplicable"
;
value $TIMPORT

"1"="Nada importante"
"2"="Poco importante"
"3"="Bastante importante"
"4"="Muy importante"
"9"="NS/NC"
" "="No aplicable"
;
value $TStProf

"1"="Trabajador en pr�cticas, formaci�n (incluido MIR, EIR, FIR,�) o becario"
"2"="Asalariado con trabajo permanente o contrato de trabajo de duraci�n indefinida"
"3"="Asalariado con trabajo temporal o contrato de trabajo de duraci�n determinada"
"4"="Empresario con asalariados"
"5"="Trabajador independiente o empresario sin asalariados"
"6"="Ayuda en la empresa o negocio familiar"
" "="No aplicable"
;
value $TJornad

"1"="A tiempo parcial"
"2"="A tiempo completo"
"9"="NS/NC"
" "="No aplicable"
;
value $TTamano

"0"="Trabajadores independientes o aut�nomos sin asalariados"
"1"="De 1 a 9 personas"
"2"="Entre 10 y 19 personas"
"3"="Entre 20 y 49 personas"
"4"="Entre 50 y 249 personas"
"5"="250 o m�s personas"
"9"="NS/NC"
" "="No aplicable"
;
value $TAnio

"9999"="NS/NC"
"    "="No aplicable"
;
value $TSUELDO

"1"="Menos de 700 euros"
"2"="De 700 a 999 euros"
"3"="De 1.000 a 1.499 euros"
"4"="De 1.500 a 1.999 euros"
"5"="De 2.000 a 2.499 euros"
"6"="De 2.500 a 2.999 euros"
"7"="De 3.000 euros en adelante"
"9"="NS/NC"
" "="No aplicable"
;
value $TNivEst

"1"="Doctorado"
"2"="M�ster"
"3"="T�tulo universitario (excepto doctorado o m�ster)"
"4"="Formaci�n profesional de grado superior"
"5"="Formaci�n profesional de grado medio/ bachillerato"
"6"="Formaci�n profesional b�sica"
"7"="ESO, EGB, etc."
"9"="NS/NC"
" "="No aplicable"
;
value $TAreEst

"1"="Exclusivamente su propia �rea de estudios"
"2"="Su propia �rea o alguna relacionada"
"3"="Un �rea totalmente diferente"
"4"="Ning�n �rea en particular"
"9"="NS/NC"
" "="No aplicable"
;
value $TFacTrb

"1"="Nada"
"2"="Poco"
"3"="Algo"
"4"="Bastante"
"5"="Mucho"
"9"="NS/NC"
" "="No aplicable"
;
value $T3SiNo

"1"="S�"
"2"="No, pero est� esperando respuesta a solicitudes anteriores de empleo o los resultados de una oposici�n"
"3"="No"
"9"="NS/NC"
" "="No aplicable"
;
value $TPRAC

"1"="S�, como parte del plan de estudios"
"2"="S�, fuera del plan de estudios"
"3"="S�, ambos tipos de pr�cticas"
"4"="No"
;
value $T2TIEMP

"0"="Continu� al menos 6 meses m�s en el trabajo que ten�a mientras estudiaba"
"1"="Menos de tres meses"
"2"="De 3 a 6 meses"
"3"="De 6 meses a 1 a�o"
"4"="De 1 a�o a a�o y medio"
"5"="De 1 a�o y medio a 2 a�os"
"6"="2 � m�s a�os"
"9"="NS/NC"
" "="No aplicable"
;
value $T2MOBUT

"0"="Continu� al menos 6 meses m�s en el trabajo que ten�a mientras estudiaba"
"1"="Antes de terminar los estudios de la titulaci�n que finaliz� en 2014"
"2"="Despu�s de terminar los estudios de la titulaci�n que finaliz� en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $T3TIEMP

"1"="Menos de 6 meses"
"2"="De 6 meses a 1 a�o"
"3"="De 1 a�o a a�o y medio"
"4"="De 1 a�o y medio a 2 a�os"
"5"="2 o m�s a�os"
"9"="NS/NC"
" "="No aplicable"
;
value $TNmEmpl

"11"="11 o m�s"
"99"="NS/NC"
"  "="No aplicable"
;
value $TESTCIV

"1"="Soltero"
"2"="Casado"
"3"="Viudo"
"4"="Separado"
"5"="Divorciado"
"9"="NS/NC"
;
value $TNPER

"6"="6 o m�s"
"9"="NS/NC"
" "="No aplicable"
;
value $TTIPO

"1"="Hogar unipersonal"
"2"="Padre o madre solo/a que convive con alg�n hijo menor de 25 a�os"
"3"="Padre o madre solo/a que convive con todos sus hijos de 25 a�os o m�s"
"4"="Pareja sin hijos que convivan en el hogar"
"5"="Pareja con alg�n hijo menor de 25 a�os y que conviven en el hogar"
"6"="Pareja con alg�n hijo menor pero todos de 25 a�os � m�s y que conviven en el hogar"
"7"="Pareja, o un padre/madre, que conviven con hijos menores de 25 a�os, y otras personas"
"8"="Otro tipo de hogar"
"9"="NS/NC"
;
value $TCOTIZ

"1"="Por cuenta propia"
"2"="Por cuenta ajena"
"3"="Por cuenta propia y ajena"
" "="No aplicable"
;
value $TQuintl

"1"="Primer quintil"
"2"="Segundo quintil"
"3"="Tercer quintil"
"4"="Cuarto quintil"
"5"="Quinto quintil"
"9"="NS/NC"
" "="No aplicable"
;
value $TNuCurs

"0"="No ha realizado ning�n curso de formaci�n del SEPE"
"1"="Un curso de formaci�n del SEPE"
"2"="Dos cursos de formaci�n del SEPE"
"3"="Tres cursos de formaci�n del SEPE"
"4"="Cuatro cursos de formaci�n del SEPE"
"5"="Cinco cursos de formaci�n del SEPE"
"6"="Seis cursos de formaci�n del SEPE"
;
value $TDsCurs

"01"="Administraci�n y gesti�n"
"02"="Actividades f�sicas y deportivas"
"03"="Agraria"
"04"="Artes gr�ficas"
"05"="Artes y artesan�as"
"06"="Comercio y marketing"
"07"="Electricidad y electr�nica"
"08"="Energ�a y agua"
"09"="Edificaci�n y obra civil"
"10"="Formaci�n complementaria"
"11"="Fabricaci�n mec�nica"
"12"="Hosteler�a y turismo"
"13"="Industrias extractivas"
"14"="Inform�tica y comunicaciones"
"15"="Instalaci�n y mantenimiento"
"16"="Imagen personal"
"17"="Imagen y sonido"
"18"="Industrias alimentarias"
"19"="Madera, mueble y corcho"
"20"="Mar�timo pesquera"
"21"="Qu�mica"
"22"="Sanidad"
"23"="Seguridad y medioambiente"
"24"="Servicios socioculturales y a la comunidad"
"25"="Textil, confecci�n y piel"
"26"="Transporte y mantenimiento de veh�culos"
"27"="Vidrio y cer�mica"
"99"="NS/NC"
" "="No aplicable"
;
value $TDrCurs

"1"="200 horas o menos"
"2"="De 201 a 300 horas"
"3"="De 301 a 500 horas"
"4"="M�s de 500 horas"
" "="No aplicable"
;
value $TReCurs

"1"="Abandona por colocaci�n"
"2"="Abandona por otras causas"
"3"="Termina con evaluaci�n positiva"
"4"="Termina con evaluaci�n negativa"
" "="No aplicable"
;
value $TAnCurs

" "="No aplicable"
;
value $TTITULA

"011101"="Pedagog�a"
"011201"="Educaci�n infantil"
"011301"="Educaci�n primaria"
"011401"="Otros maestros"
"011901"="Educaci�n social"
"021101"="Audiovisual, imagen y multimedia"
"021201"="Dise�o"
"021301"="Bellas artes"
"021302"="Historia del arte"
"021401"="Conservaci�n y restauraci�n"
"021502"="M�sica y Artes esc�nicas"
"022201"="Arqueolog�a"
"022202"="Historia"
"022301"="Filosof�a"
"022901"="Humanidades"
"023101"="Lengua inglesa"
"023102"="Lenguas cl�sicas"
"023103"="Otras lenguas extranjeras"
"023104"="Traducci�n e interpretaci�n"
"023201"="Lenguas y dialectos espa�oles"
"023202"="Literatura"
"023901"="Lenguas modernas y aplicadas"
"031101"="Econom�a"
"031201"="Pol�tica y gesti�n p�blica"
"031202"="Relaciones internacionales"
"031301"="Psicolog�a"
"031401"="Antropolog�a social y cultural y Estudios y gesti�n de la cultura"
"031402"="Criminolog�a"
"031404"="Geograf�a"
"031406"="Sociolog�a e Igualdad de g�nero"
"032101"="Comunicaci�n"
"032102"="Periodismo"
"032201"="Informaci�n y documentaci�n"
"041201"="Financiera y actuarial"
"041202"="Finanzas y contabilidad"
"041301"="Administraci�n y empresa"
"041302"="Ciencias del trabajo"
"041303"="Gesti�n y administraci�n p�blica"
"041401"="Marketing"
"041402"="Protocolo y eventos"
"041403"="Publicidad y relaciones p�blicas"
"041601"="Comercio"
"042101"="Derecho"
"051101"="Biolog�a"
"051201"="Bioqu�mica"
"051202"="Biotecnolog�a"
"051901"="Biomedicina"
"052101"="Ciencias ambientales"
"053101"="Qu�mica"
"053201"="Ciencias del mar"
"053202"="Geograf�a y ordenaci�n del territorio"
"053203"="Geolog�a"
"053301"="F�sica"
"054101"="Matem�ticas"
"054201"="Estad�stica"
"061301"="Desarrollo de software y de aplicaciones e Ingenier�a multimedia"
"061901"="Inform�tica"
"071101"="Ingenier�a qu�mica industrial e Ingenier�a medioambiental"
"071301"="Ingenier�a de la energ�a"
"071302"="Ingenier�a el�ctrica"
"071401"="Ingenier�a de computadores"
"071402"="Ingenier�a de sonido e imagen"
"071403"="Ingenier�a de telecomunicaci�n"
"071404"="Ingenier�a electr�nica industrial y autom�tica"
"071405"="Ingenier�a en electr�nica"
"071501"="Ingenier�a en dise�o industrial y desarrollo del producto"
"071502"="Ingenier�a en tecnolog�as industriales"
"071503"="Ingenier�a mec�nica"
"071601"="Ingenier�a aeron�utica"
"071603"="Ingenier�a naval y oce�nica"
"071901"="Ingenier�a de organizaci�n industrial y Nanotecnolog�a"
"072101"="Ciencia y tecnolog�a de los alimentos e Ingenier�a alimentaria"
"072102"="Enolog�a"
"072201"="Ingenier�a de materiales e Ingenier�a textil"
"072401"="Ingenier�a de minas y energ�a"
"073101"="Arquitectura y Urbanismo y paisajismo"
"073102"="Ingenier�a geom�tica, topograf�a y cartograf�a"
"073201"="Arquitectura t�cnica"
"073202"="Ingenier�a civil"
"081102"="Ingenier�a agraria y agroalimentaria"
"081103"="Ingenier�a agr�cola, agropecuaria y medio rural"
"081201"="Ingenier�a horticultura y jardiner�a"
"082101"="Ingenier�a forestal y montes"
"084101"="Veterinaria"
"091101"="Odontolog�a"
"091201"="Medicina"
"091301"="Enfermer�a"
"091401"="Ingenier�a biom�dica y de la salud"
"091402"="�ptica y optometr�a"
"091501"="Fisioterapia"
"091502"="Logopedia"
"091503"="Nutrici�n humana y diet�tica"
"091504"="Podolog�a"
"091505"="Terapia ocupacional"
"091601"="Farmacia"
"092301"="Trabajo social"
"101401"="Actividad f�sica y del deporte"
"101501"="Turismo"
"104101"="N�utica y transporte mar�timo"
"104103"="Servicio de transporte terrestre y Servicio de transporte a�reo"
"109999"="Servicios (otros estudios)"
;
value $TOcupac

"11"="Miembros del poder ejecutivo y de los cuerpos legislativos; directivos de la Administraci�n P�blica y organizaciones de inter�s social; directores ejecutivos"
"12"="Directores de departamentos administrativos y comerciales (directores financieros, directores de recursos humanos, directores comerciales, directores de publicidad, directores de desarrollo,�)"
"13"="Directores de producci�n y operaciones: Directores de producci�n de explotaciones agropecuarias, forestales y pesqueras, y de industrias manufactureras, de miner�a, construcci�n,�; Directores de servicios de TIC y de empresas de servicios profesionales"
"14"="Directores y gerentes de empresas de alojamiento, restauraci�n y comercio"
"15"="Directores y gerentes de otras empresas de servicios no clasificados bajo otros ep�grafes: Directores y gerentes de empresas de actividades recreativas, culturales y deportivas; Directores y gerentes de empresas de gesti�n de residuos y de otros servicios no clasificados bajo otros ep�grafes"
"21"="Profesionales de la salud: M�dicos; Profesionales de enfermer�a y parter�a; Veterinarios; Farmac�uticos; Otros profesionales de la salud (odont�logos, fisioterapeutas, dietistas, logopedas,�)"
"22"="Profesionales de la ense�anza infantil, primaria, secundaria y postsecundaria: Profesores de universidades y otra ense�anza superior; Profesores de formaci�n profesional; Profesores de ense�anza secundaria; Profesores de ense�anza primaria; Maestros y educadores de ense�anza infantil"
"23"="Otros profesionales de la ense�anza: Profesores y t�cnicos de educaci�n especial; Otros profesores y profesionales de la ense�anza (profesores de ense�anza no reglada de idiomas, m�sica y danza, artes�, profesionales de la educaci�n ambiental, �)"
"24"="Profesionales de la ciencias f�sicas, qu�micas, matem�ticas y de las ingenier�as: F�sicos, qu�micos, matem�ticos y afines; Profesionales en ciencias naturales (bi�logos, ingenieros agr�nomos, de montes, t�cnicos agr�colas, �); Ingenieros; Arquitectos, urbanistas e ingenieros ge�grafos; Ingenieros t�cnicos; Arquitectos t�cnicos, top�grafos y dise�adores"
"25"="Profesionales en derecho: Jueces, magistrados, abogados y fiscales; Otros profesionales del derecho (notarios y registradores, procuradores, �)"
"26"="Especialistas en organizaci�n de la Administraci�n P�blica y de las empresas y en la comercializaci�n: Especialistas en finanzas; Especialistas en organizaci�n y administraci�n; T�cnicos de empresas y actividades tur�sticas; Profesionales de ventas t�cnicas y m�dicas (excepto las TIC); Otros profesionales de las ventas, la comercializaci�n, la publicidad y las relaciones p�blicas"
"27"="Profesionales de las tecnolog�as de la informaci�n: Analistas y dise�adores de software y multimedia; Especialistas en bases de datos y en redes inform�ticas"
"28"="Profesionales en ciencias sociales: Economistas; Soci�logos, historiadores, psic�logos y otros profesionales en ciencias sociales (ge�grafos, antrop�logos, arque�logos, fil�sofos, profesionales en ciencias pol�ticas�); Sacerdotes de las distintas religiones"
"29"="Profesionales de la cultura y el espect�culo: Archivistas, bibliotecarios, conservadores y afines; Escritores, periodistas y ling�istas (fil�logos, int�rpretes y traductores); Artistas creativos e interpretativos (compositores, m�sicos, cantantes, core�grafos, bailarines, directores de cine, de teatro y afines, actores, locutores de radio, televisi�n, profesionales de espect�culos taurinos, ...)"
"31"="T�cnicos de las ciencias y de las ingenier�as: Delineantes y dibujantes t�cnicos; T�cnicos de las ciencias f�sicas, qu�micas, medioambientales y de las ingenier�as; T�cnicos en control de procesos (t�cnicos en instalaciones de producci�n de energ�a, en instalaciones de tratamiento de residuos, aguas, t�cnicos de refiner�as de petr�leo y gas natural,...); T�cnicos de las ciencias naturales y profesionales auxiliares afines; Profesionales en navegaci�n mar�tima y aeron�utica; T�cnicos de control de calidad de las ciencias f�sicas, qu�micas y de las ingenier�as"
"32"="Supervisores en ingenier�a de minas, de industrias manufactureras y de la construcci�n"
"33"="T�cnicos sanitarios y profesionales de las terapias alternativas: T�cnicos sanitarios de laboratorio, pruebas diagn�sticas y pr�tesis; Otros t�cnicos sanitarios (t�cnicos superiores en higiene bucodentasl en documentaci�n sanitaria, en diet�tica, ayudantes de veterinaria, ...); Profesionales de las terapias alternativas (profesionales de la acupuntura, la naturopat�a, la homeopat�a, ...)"
"34"="Profesionales de apoyo en finanzas y matem�ticas (Profesionales de apoyo e intermediarios de cambio, bolsa y finanzas; Comerciales de pr�stamos y cr�ditos; Tenedores de libros; Profesionales de apoyo en servicios estad�sticos, matem�ticos y afines; Tasadores)"
"35"="Representantes, agentes comerciales y afines (Mediadores y agentes de seguros; Consignatarios; Representantes de aduanas; Organizadores de conferencias y eventos; Agentes o intermediarios en la contrataci�n de la mano de obra; Portavoces y agentes de relaciones p�blicas)"
"36"="Profesionales de apoyo a la gesti�n administrativa; t�cnicos de las fuerzas y cuerpos de seguridad: Asistentes administrativos y especializados (Supervisores de secretar�a, secretarios de centros m�dicos o cl�nicas,...); Agentes de aduanas, tributos y afines que trabajan en tareas propias de la Administraci�n P�blica; T�cnicos de las fuerzas y cuerpos de seguridad (t�cnicos de la polic�a nacional, auton�mica y local, suboficiales de la guardia civil)"
"37"="Profesionales de apoyo de servicios jur�dicos, sociales, culturales, deportivos y afines: Profesionales de apoyo de servicios jur�dicos y sociales (detectives privados, animadores comunitarios, auxiliares laicos de las religiones,�); Deportistas, entrenadores, instructores de actividades deportivas; monitores de actividades recreativas; T�cnicos y profesionales de apoyo de actividades culturales, art�sticas y culinarias (fot�grafos, dise�adores y decoradores de interior, chefs,...)"
"38"="T�cnicos de las tecnolog�as de la informaci�n y las comunicaciones (TIC): T�cnicos en operaciones de tecnolog�as de la informaci�n y asistencia al usuario; Programadores inform�ticos; T�cnicos en grabaci�n audiovisual, radiodifusi�n y telecomunicaciones"
"41"="Empleados en servicios contables, financieros, y de servicios de apoyo a la producci�n y al transporte (Empleados de contabilidad, de control de personal y n�minas, de oficina de servicios estad�sticos, financieros y bancarios, de control de abastecimientos e inventario, de log�stica y transporte de pasajeros y mercanc�as, ...)"
"42"="Empleados de bibliotecas, servicios de correos y afines"
"43"="Otros empleados administrativos sin tareas de atenci�n al p�blico (grabadores de datos, empleados administrativos sin tareas de atenci�n al p�blico no clasificados bajo otros ep�grafes)"
"44"="Empleados de agencias de viajes, recepcionistas y telefonistas; empleados de ventanilla y afines (excepto taquilleros): Empleados de informaci�n y recepcionistas (excepto de hoteles); Empleados de agencias de viajes, recepcionistas de hoteles y telefonistas; Agentes de encuestas; Empleados de ventanilla y afines (excepto taquilleros) (cajeros de bancos, empleados de sala de juegos, empleados de mostrador de correos,...)"
"45"="Empleados administrativos con tareas de atenci�n al p�blico no clasificados bajo otros ep�grafes"
"50"="Camareros y cocineros propietarios"
"51"="Trabajadores asalariados de los servicios de restauraci�n: Cocineros asalariados; Camareros asalariados"
"52"="Dependientes en tiendas y almacenes: Jefes de secci�n de tiendas y almacenes; Vendedores en tiendas y almacenes"
"53"="Comerciantes propietarios de tiendas"
"54"="Vendedores (excepto en tiendas y almacenes): Vendedores en quioscos o en mercadillos; Operadores de telemarketing; Expendedores de gasolineras; Otros vendedores (vendedores a domicilio, promotores de venta, modelos de moda, arte y publicidad,�)"
"55"="Cajeros y taquilleros (excepto bancos)"
"56"="Trabajadores de los cuidados a las personas en servicios de salud: Auxiliares de enfermer�a; T�cnicos auxiliares de farmacia y emergencias sanitarias y otros trabajadores de los cuidados a las personas en servicios de salud"
"57"="Otros trabajadores de los cuidados a las personas: Trabajadores de los cuidados personales a domicilio; Cuidadores de ni�os (en guarder�as y centros educativos, en domicilios)"
"58"="Trabajadores de los servicios personales: Peluqueros y especialistas en tratamientos de est�tica, bienestar y afines; Trabajadores que atienden a viajeros, gu�as tur�sticos y afines (auxiliares de vuelo y camareros de avi�n, barco y tren, revisores y cobradores de transporte terrestre, acompa�antes tur�sticos, azafatos de tierra,...); Supervisores de mantenimiento y limpieza de edificios, conserjes y mayordomos dom�sticos; Trabajadores propietarios de peque�os alojamientos; Otros trabajadores de servicios personales (empleados de pompas f�nebres y embalsamadores, cuidadores de animales y adiestradores, instructores de autoescuela, astr�logos, adivinadores,...)"
"59"="Trabajadores de los servicios de protecci�n y seguridad: Guardias civiles; Polic�as (nacionales, auton�micos y locales); Bomberos; Personal de seguridad privado; Otros trabajadores de los servicios de protecci�n y seguridad (vigilantes de prisiones, ba�istas-socorristas, agentes forestales y medioambientales,...)"
"61"="Trabajadores cualificados en actividades agr�colas"
"62"="Trabajadores cualificados en actividades ganaderas, (incluidas av�colas, ap�colas y similares)"
"63"="Trabajadores cualificados en actividades agropecuarias mixtas"
"64"="Trabajadores cualificados en actividades forestales, pesqueras y cineg�ticas"
"71"="Trabajadores en obras estructurales de construcci�n y afines: Trabajadores en hormig�n, encofradores, ferrallistas y afines; Alba�iles, canteros, tronzadores, labrantes y grabadores de piedras; Carpinteros (excepto ebanistas y montadores de estructuras met�licas); Otros trabajadores de las obras estructurales de construcci�n (mantenedores de edificios, instaladores de fachadas t�cnicas, instaladores de sistemas de impermeabilizaci�n en edificios,...)"
"72"="Trabajadores de acabado de construcciones e instalaciones (excepto electricistas), pintores y afines: Escayolistas y aplicadores de revestimientos de pasta y mortero; Fontaneros e instaladores de tuber�as; Pintores, empapeladores y afines; Soladores, colocadores de parquet y afines; Mec�nicos-instaladores de refrigeraci�n y climatizaci�n; Otros trabajadores de acabado en la construcci�n, instalaciones (excepto electricistas) y afines (montadores de cubiertas, cristaleros, montadores-instaladores de placas de energ�a solar, personal de limpieza de fachadas de edificios y chimeneas,...)"
"73"="Soldadores, chapistas, montadores de estructuras met�licas, herreros, elaboradores de herramientas y afines: Moldeadores, soldadores, chapistas, montadores de estructuras met�licas y trabajadores afines; Herreros y trabajadores de la fabricaci�n de herramientas y afines"
"74"="Mec�nicos y ajustadores de maquinaria (veh�culos de motor, motores de avi�n, maquinaria agr�cola e industrial, maquinaria naval y ferroviaria, reparadores de bicicletas,�)"
"75"="Trabajadores especializados en electricidad y electrotecnolog�a: Electricistas de la construcci�n y afines; Otros instaladores y reparadores de equipos el�ctricos; Instaladores y reparadores de equipos electr�nicos y de telecomunicaciones"
"76"="Mec�nicos de precisi�n en metales, ceramistas, vidrieros, artesanos y trabajadores de artes gr�ficas: Mec�nicos de precisi�n en metales, ceramistas, vidrieros y artesanos (relojeros, afinadores de instrumentos musicales, joyeros, alfareros, sopladores de vidrio, rotulistas, artesanos en madera, cesteros, artesanos en tejidos, cueros y materiales similares,...); Oficiales y operarios de las artes gr�ficas (trabajadores de procesos de preimpresi�n, impresi�n, encuadernaci�n)"
"77"="Trabajadores de la industria de la alimentaci�n, bebidas y tabaco (matarifes, trabajadores de las industrias del pescado, panaderos, pasteleros, trabajadores del tratamiento de la leche, trabajadores de la elaboraci�n de bebidas, catadores, �)"
"78"="Trabajadores de la madera, textil, confecci�n, piel, cuero, calzado y otros operarios en oficios: Trabajadores que tratan la madera y afines; Ebanistas y trabajadores afines; Trabajadores del textil, confecci�n, piel, cuero y calzado; Pegadores, buceadores, probadores de productos y otros operarios y artesanos diversos"
"81"="Operadores de instalaciones y maquinaria fijas: Operadores en instalaciones de la extracci�n y explotaci�n de minerales; Operadores en instalaciones para el tratamiento de metales; Operadores de instalaciones y m�quinas de productos qu�micos, farmac�uticos y materiales fotosensibles; Operadores en instalaciones para el tratamiento y transformaci�n de la madera, la fabricaci�n de papel, productos de papel y caucho o materias pl�sticas; Operadores de m�quinas para fabricar productos textiles y art�culos de piel y de cuero; Operadores de m�quinas para elaborar productos alimenticios, bebidas y tabaco; Operadores de m�quinas de lavander�a y tintorer�a; Otros operadores de instalaciones y maquinaria fijas"
"82"="Montadores y ensambladores en f�bricas (de maquinaria mec�nica, de equipos el�ctricos y electr�ncios,�)"
"83"="Maquinistas de locomotoras, operadores de maquinaria agr�cola y de equipos pesados m�viles, y marineros: Maquinistas de locomotoras y afines; Operadores de maquinaria agr�cola y forestal m�vil; Operadores de otras m�quinas m�viles (maquinaria de movimientos de tierras, gr�as, montacargas, carretillas elevadoras,...); Marineros de puente, marineros de m�quinas y afines"
"84"="Conductores de veh�culos para el transporte urbano o por carretera: Conductores de autom�viles, taxis y furgonetas; Conductores de autobuses y tranv�as; Conductores de camiones; Conductores de motocicletas y ciclomotores"
"91"="Empleados dom�sticos"
"92"="Otro personal de limpieza: Personal de limpieza de oficinas, hoteles y otros establecimientos similares; Limpiadores de veh�culos, ventanas y personal de limpieza a mano"
"93"="Ayudantes de preparaci�n de alimentos: Ayudantes de cocina; Preparadores de comidas r�pidas"
"94"="Recogedores de residuos urbanos, vendedores callejeros y otras ocupaciones elementales en servicios: Vendedores callejeros; Repartidores de publicidad, limpiabotas y otros trabajadores de oficios callejeros; Ordenanzas, mozos de equipaje, repartidores a pie y afines; Recogedores de residuos, clasificadores de desechos, barrenderos y afines; Otras ocupaciones elementales"
"95"="Peones agrarios, forestales y de la pesca: Peones agr�colas; Peones ganaderos; Peones agropecuarios; Peones de la pesca, la acuicultura, forestales y de la caza"
"96"="Peones de la construcci�n y de la miner�a"
"97"="Peones de las industrias manufactureras"
"98"="Peones del transporte, descargadores y reponedores"
"00"="Ocupaciones militares: Oficiales y suboficiales de las fuerzas armadas; Tropa y mariner�a de las fuerzas armadas"
"99"="NS/NC"
"  "="No aplicable"
;
value $TCNAE

"AA"="Agricultura, ganader�a, silvicultura y pesca"
"BB"="Industrias extractivas"
"CC"="Industria manufacturera"
"DD"="Suministro de energ�a el�ctrica, gas, vapor y aire acondicionado"
"EE"="Suministro de agua, actividades de saneamiento, gesti�n de residuos y descontaminaci�n"
"FF"="Construcci�n e ingenier�a civil"
"GG"="Comercio al por mayor y al por menor; reparaci�n de veh�culos de motor y motocicletas"
"HH"="Transporte, almacenamiento, actividades postales y de correos"
"II"="Hosteler�a"
"JJ"="Informaci�n y comunicaciones (actividades de edici�n, cinematogr�ficas, de v�deo, de sonido, programas de televisi�n, telecomunicaciones, programaci�n inform�tica y servicios de informaci�n)"
"KK"="Actividades financieras y de seguros"
"LL"="Actividades inmobiliarias"
"M1"="Actividades profesionales, cient�ficas y t�cnicas"
"M2"="Actividades de fotograf�a"
"M3"="Actividades veterinarias"
"N1"="Actividades de alquiler"
"N2"="Actividades relacionadas con el empleo"
"N3"="Actividades de agencias de viajes, operadores tur�sticos, servicios de reservas y actividades relacionadas con los mismos"
"N4"="Actividades de seguridad e investigaci�n"
"N5"="Servicios a edificios y actividades de jardiner�a"
"N6"="Actividades administrativas de oficina y otras actividades auxiliares a las empresas"
"OO"="Administraci�n P�blica y defensa; Seguridad Social obligatoria"
"PP"="Educaci�n"
"QQ"="Actividades sanitarias y de servicios sociales"
"RR"="Actividades art�sticas, culturales, recreativas, deportivas y de entrenimiento"
"S1"="Actividades asociativas y sindicales"
"S2"="Reparaci�n de ordenadores"
"S3"="Efectos personales y art�culos de uso dom�stico y otros servicios personales (lavado y limpieza de prendas, peluquer�a y otros tratamientos de belleza, pompas f�nebres y actividades relacionadas)"
"S4"="Actividades de mantenimiento f�sico"
"TT"="Particulares como empleadores de personal dom�stico; particulares como productores de bienes y servicios para uso propio"
"UU"="Actividades de organizaciones y organismos extraterritoriales"
"99"="NS/NC"
"  "="No aplicable"
;

* 3) VINCULAR FORMATOS A LA BASE DE DATOS;
data ROutput.EILU_GRAD_2019_ConFormato;
	set ROutput.EILU_GRAD_2019;

FORMAT SEXO $TSEXO.;
FORMAT EDAD $TEDAD.;
FORMAT NACIO $TNACIO.;
FORMAT NACIO1 $TNACIOP.;
FORMAT NACIO2 $TNACIOP.;
FORMAT PAIS_NACI $TNACIP.;
FORMAT TITU $TTITULA.;
FORMAT RAMA $TRAMA.;
FORMAT AMBITO $TAMBITO.;
FORMAT T_UNIV $TTPUNIV.;
FORMAT DISCA $T1SINO.;
FORMAT PROXY $TPROXY.;
FORMAT LUG_RES_PAIS $T1PAIS.;
FORMAT PAIS_NAC_PADRE $TNACIP.;
FORMAT ESTUDIOS_PADRE $TNFORMA.;
FORMAT PAIS_NAC_MADRE $TNACIP.;
FORMAT ESTUDIOS_MADRE $TNFORMA.;
FORMAT EST_B1 $T2SINO.;
FORMAT EST_B2_1 $T2SINO.;
FORMAT EST_B2_2 $T2SINO.;
FORMAT EST_B2_3 $T2SINO.;
FORMAT EST_B2_4 $T2SINO.;
FORMAT EST_B2_5 $T2SINO.;
FORMAT EST_M1 $T2SINO.;
FORMAT EST_M2 $T2ESTM.;
FORMAT EST_M3 $T2PAIS.;
FORMAT EST_M4 $T4ESTM.;
FORMAT EST_MES $T2SINO.;
FORMAT EST_B8 $TMOTEST.;
FORMAT SAT1 $T2SINO.;
FORMAT SAT2 $T2SINO.;
FORMAT EST_B11_1 $T1SINO.;
FORMAT EST_B11_2 $T1SINO.;
FORMAT EST_B11_3 $T1SINO.;
FORMAT EST_B11_4 $T1SINO.;
FORMAT EST_B11_5 $T1SINO.;
FORMAT EST_B11_6 $T1SINO.;
FORMAT EST_B11_7 $T1SINO.;
FORMAT EST_B12 $TNUMEST.;
FORMAT EST_B13_AMB1 $TAMBITO.;
FORMAT EST_B14_1 $TESTMMN.;
FORMAT EST_B15_1 $TESTEXT.;
FORMAT EST_B13_AMB2 $TAMBITO.;
FORMAT EST_B14_2 $TESTMMN.;
FORMAT EST_B15_2 $TESTEXT.;
FORMAT EST_B13_AMB3 $TAMBITO.;
FORMAT EST_B14_3 $TESTMMN.;
FORMAT EST_B15_3 $TESTEXT.;
FORMAT EST_B16 $TNUMEST.;
FORMAT EST_B17_M1 $TRAMA.;
FORMAT EST_B18_1 $TESTMMN.;
FORMAT EST_B19_1 $TESTEXT.;
FORMAT EST_B17_M2 $TRAMA.;
FORMAT EST_B18_2 $TESTMMN.;
FORMAT EST_B19_2 $TESTEXT.;
FORMAT EST_B17_M3 $TRAMA.;
FORMAT EST_B18_3 $TESTMMN.;
FORMAT EST_B19_3 $TESTEXT.;
FORMAT EST_B21 $TRAMA.;
FORMAT EST_B22 $TESTMMN.;
FORMAT EST_B23 $TESTEXT.;
FORMAT EST_B24 $TNUMEST.;
FORMAT EST_B25_FA1 $TFAMIGS.;
FORMAT EST_B26_1 $TESTMMN.;
FORMAT EST_B27_1 $TESTEXT.;
FORMAT EST_B25_FA2 $TFAMIGS.;
FORMAT EST_B26_2 $TESTMMN.;
FORMAT EST_B27_2 $TESTEXT.;
FORMAT EST_B25_FA3 $TFAMIGS.;
FORMAT EST_B26_3 $TESTMMN.;
FORMAT EST_B27_3 $TESTEXT.;
FORMAT EST_B28 $TNUMEST.;
FORMAT EST_B29_FA1 $TFAMIGM.;
FORMAT EST_B30_1 $TESTMMN.;
FORMAT EST_B31_1 $TESTEXT.;
FORMAT EST_B29_FA2 $TFAMIGM.;
FORMAT EST_B30_2 $TESTMMN.;
FORMAT EST_B31_2 $TESTEXT.;
FORMAT EST_B29_FA3 $TFAMIGM.;
FORMAT EST_B30_3 $TESTMMN.;
FORMAT EST_B31_3 $TESTEXT.;
FORMAT EST2_SA $TESTSNT.;
FORMAT EST2_NC $TESTCRS.;
FORMAT IDI_MT1 $Tidioma.;
FORMAT IDI_MT2 $Tidioma.;
FORMAT IDIOMAS $TNUMIDI.;
FORMAT IDIOMA1 $Tidioma.;
FORMAT NIV_ID1 $TNivIdi.;
FORMAT ACREIDI1 $T2SINO.;
FORMAT TIPOACREIDI1 $TIPACRE.;
FORMAT IDIOMA2 $Tidioma.;
FORMAT NIV_ID2 $TNivIdi.;
FORMAT ACREIDI2 $T2SINO.;
FORMAT TIPOACREIDI2 $TIPACRE.;
FORMAT IDIOMA3 $Tidioma.;
FORMAT NIV_ID3 $TNivIdi.;
FORMAT ACREIDI3 $T2SINO.;
FORMAT TIPOACREIDI3 $TIPACRE.;
FORMAT IDIOMA4 $Tidioma.;
FORMAT NIV_ID4 $TNivIdi.;
FORMAT ACREIDI4 $T2SINO.;
FORMAT TIPOACREIDI4 $TIPACRE.;
FORMAT TITIDI $T2SINO.;
FORMAT TIC $TTIC.;
FORMAT EST_B38_1 $T1SINO.;
FORMAT EST_B39_1 $T2SINO.;
FORMAT EST_B38_2 $T1SINO.;
FORMAT EST_B39_2 $T2SINO.;
FORMAT EST_B38_3 $T1SINO.;
FORMAT EST_B39_3 $T2SINO.;
FORMAT EST_B38_4 $T1SINO.;
FORMAT EST_B39_4 $T2SINO.;
FORMAT EST_B38_5 $T1SINO.;
FORMAT EST_B39_5 $T2SINO.;
FORMAT EST_B38_6 $T1SINO.;
FORMAT EST_B39_6 $T2SINO.;
FORMAT EST_B38_7 $T1SINO.;
FORMAT EST_B39_7 $T2SINO.;
FORMAT MOV_IN $T2SINO.;
FORMAT MOVRAZ1 $T2SINO.;
FORMAT MOVRAZ2 $T2SINO.;
FORMAT MOVRAZ3 $T2SINO.;
FORMAT MOVRAZ4 $T2SINO.;
FORMAT MOVRAZ5 $T2SINO.;
FORMAT MVFUERA $T2SINO.;
FORMAT MOVPAI1 $TPAIMOV.;
FORMAT MOVPAI2 $TPAIMOV.;
FORMAT MOVPAI3 $TPAIMOV.;
FORMAT MOVRA21 $T2SINO.;
FORMAT MOVRA22 $T2SINO.;
FORMAT MOVRA23 $T2SINO.;
FORMAT MOVRA24 $T2SINO.;
FORMAT MOVRA25 $T2SINO.;
FORMAT MOVRA26 $T2SINO.;
FORMAT MOV_C7 $TVIVIRF.;
FORMAT MOV_C8_1 $T2SINO.;
FORMAT MOV_C8_2 $T2SINO.;
FORMAT MOV_C8_3 $T2SINO.;
FORMAT MOV_C8_4 $T2SINO.;
FORMAT MOV_C8_5 $T2SINO.;
FORMAT MOV_C8_6 $T2SINO.;
FORMAT MOV_C9 $TPAIMOV.;
FORMAT RETORNO $T2SINO.;
FORMAT TRBPRN1 $T1TRBPN.;
FORMAT TRBPRN2 $T2TRBPN.;
FORMAT TRINAC_D4 $T2SINO.;
FORMAT TRINAC_D5 $T1MOBUT.;
FORMAT TRINAC_D6 $T1TIEMP.;
FORMAT TRPARA_D5 $T1MOBUT.;
FORMAT TRPARA_D6 $T1TIEMP.;
FORMAT TRPARA_D7_1 $T2SINO.;
FORMAT TRPARA_D7_2 $T2SINO.;
FORMAT TRPARA_D7_3 $T2SINO.;
FORMAT TRPARA_D7_4 $T2SINO.;
FORMAT TRPARA_D7_5 $T2SINO.;
FORMAT TRPARA_D7_6 $T2SINO.;
FORMAT TRPARA_D7_7 $T2SINO.;
FORMAT TRPARA_D7_8 $T2SINO.;
FORMAT TRPARA_D7_9 $T2SINO.;
FORMAT TRPARA_D7_10 $T2SINO.;
FORMAT TRPARA_D8_1 $TIMPORT.;
FORMAT TRPARA_D8_2 $TIMPORT.;
FORMAT TRPARA_D8_3 $TIMPORT.;
FORMAT TRPARA_D8_4 $TIMPORT.;
FORMAT TRPARA_D8_5 $TIMPORT.;
FORMAT TRPARA_D8_6 $TIMPORT.;
FORMAT TRAC_D9 $T2SINO.;
FORMAT LUG_TRAB_PAIS $T1PAIS.;
FORMAT SIT_PRO $TStProf.;
FORMAT JORNADA $TJornad.;
FORMAT TRABOC $TOcupac.;
FORMAT TR_CNAE $TCNAE.;
FORMAT TR_TAM $TTamano.;
FORMAT TR_ANIO $TAnio.;
FORMAT TR_SUELDO $TSUELDO.;
FORMAT TR_D19 $TNivEst.;
FORMAT TR_D20 $TAreEst.;
FORMAT TR_D21 $T2SINO.;
FORMAT TR_D22_1 $TFacTrb.;
FORMAT TR_D22_2 $TFacTrb.;
FORMAT TR_D22_3 $TFacTrb.;
FORMAT TR_D22_4 $TFacTrb.;
FORMAT TR_D22_5 $TFacTrb.;
FORMAT TR_D22_6 $TFacTrb.;
FORMAT TR_D23 $T3SiNo.;
FORMAT HL_E1 $TPRAC.;
FORMAT HL_E2 $T4ESTM.;
FORMAT HL_E3 $T1SINO.;
FORMAT HL_E5 $T2SINO.;
FORMAT HL_JOR $TJornad.;
FORMAT HL_E7 $T2SINO.;
FORMAT HL_E8 $T2SINO.;
FORMAT HA_TRAB $T1SINO.;
FORMAT HATR_E11 $T2TIEMP.;
FORMAT HATR_E12 $T2MOBUT.;
FORMAT HATR_BSQ1 $T2SINO.;
FORMAT HATR_BSQ2 $T2SINO.;
FORMAT HATR_BSQ3 $T2SINO.;
FORMAT HATR_BSQ4 $T2SINO.;
FORMAT HATR_BSQ5 $T2SINO.;
FORMAT HATR_BSQ6 $T2SINO.;
FORMAT HATR_BSQ7 $T2SINO.;
FORMAT HATR_BSQ8 $T2SINO.;
FORMAT HATR_BSQ9 $T2SINO.;
FORMAT HATR_BSQ10 $T2SINO.;
FORMAT HATR_BSQ11 $T2SINO.;
FORMAT P_CONTI $T2SINO.;
FORMAT PR_PAIS $T1PAIS.;
FORMAT PR_OCU $TOcupac.;
FORMAT PR_SIT_PR $TStProf.;
FORMAT PR_JOR $TJornad.;
FORMAT PR_NIVEL $TNivEst.;
FORMAT PR_AREA $TAreEst.;
FORMAT PR_CONOC $T2SINO.;
FORMAT PR_SUELDO $TSUELDO.;
FORMAT HATR_TIEMP $T3TIEMP.;
FORMAT HATR_NUM $TNmEmpl.;
FORMAT HATR_E27 $T2SINO.;
FORMAT NOTRAB_BUS $T2SINO.;
FORMAT NOTRAB_BUSM $T1MOBUT.;
FORMAT NOTRAB_BUST $T1TIEMP.;
FORMAT NOTRAB_BSQ1 $T2SINO.;
FORMAT NOTRAB_BSQ2 $T2SINO.;
FORMAT NOTRAB_BSQ3 $T2SINO.;
FORMAT NOTRAB_BSQ4 $T2SINO.;
FORMAT NOTRAB_BSQ5 $T2SINO.;
FORMAT NOTRAB_BSQ6 $T2SINO.;
FORMAT NOTRAB_BSQ7 $T2SINO.;
FORMAT NOTRAB_BSQ8 $T2SINO.;
FORMAT NOTRAB_BSQ9 $T2SINO.;
FORMAT NOTRAB_BSQ10 $T2SINO.;
FORMAT NOTRAB_DIF1 $TIMPORT.;
FORMAT NOTRAB_DIF2 $TIMPORT.;
FORMAT NOTRAB_DIF3 $TIMPORT.;
FORMAT NOTRAB_DIF4 $TIMPORT.;
FORMAT NOTRAB_DIF5 $TIMPORT.;
FORMAT NOTRAB_DIF6 $TIMPORT.;
FORMAT RECHA_TR $T2SINO.;
FORMAT RECHA_M1 $T2SINO.;
FORMAT RECHA_M2 $T2SINO.;
FORMAT RECHA_M3 $T2SINO.;
FORMAT RECHA_M4 $T2SINO.;
FORMAT RECHA_M5 $T2SINO.;
FORMAT RECHA_M6 $T2SINO.;
FORMAT RECHA_M7 $T2SINO.;
FORMAT RECHA_M8 $T2SINO.;
FORMAT RECHA_M9 $T2SINO.;
FORMAT HO_F1 $TESTCIV.;
FORMAT HO_PAREJ $T2SINO.;
FORMAT HO_NPER $TNPER.;
FORMAT HO_NPER_TR $TNPER.;
FORMAT HO_TIPO $TTIPO.;
FORMAT ALSSM15 $T1SINO.;
FORMAT COTIZ15 $TCOTIZ.;
FORMAT BCOTC15 $TQuintl.;
FORMAT ALSSM16 $T1SINO.;
FORMAT COTIZ16 $TCOTIZ.;
FORMAT BCOTC16 $TQuintl.;
FORMAT ALSSM17 $T1SINO.;
FORMAT COTIZ17 $TCOTIZ.;
FORMAT BCOTC17 $TQuintl.;
FORMAT ALSSM18 $T1SINO.;
FORMAT COTIZ18 $TCOTIZ.;
FORMAT BCOTC18 $TQuintl.;
FORMAT ALSSM19 $T1SINO.;
FORMAT COTIZ19 $TCOTIZ.;
FORMAT BCOTC19 $TQuintl.;
FORMAT N_CURS $TNuCurs.;
FORMAT DENCUR1 $TDsCurs.;
FORMAT DURCUR1 $TDrCurs.;
FORMAT RESCUR1 $TReCurs.;
FORMAT ANHCUR1 $TAnCurs.;
FORMAT DENCUR2 $TDsCurs.;
FORMAT DURCUR2 $TDrCurs.;
FORMAT RESCUR2 $TReCurs.;
FORMAT ANHCUR2 $TAnCurs.;
FORMAT DENCUR3 $TDsCurs.;
FORMAT DURCUR3 $TDrCurs.;
FORMAT RESCUR3 $TReCurs.;
FORMAT ANHCUR3 $TAnCurs.;
FORMAT DENCUR4 $TDsCurs.;
FORMAT DURCUR4 $TDrCurs.;
FORMAT RESCUR4 $TReCurs.;
FORMAT ANHCUR4 $TAnCurs.;
FORMAT DENCUR5 $TDsCurs.;
FORMAT DURCUR5 $TDrCurs.;
FORMAT RESCUR5 $TReCurs.;
FORMAT ANHCUR5 $TAnCurs.;
FORMAT DENCUR6 $TDsCurs.;
FORMAT DURCUR6 $TDrCurs.;
FORMAT RESCUR6 $TReCurs.;
FORMAT ANHCUR6 $TAnCurs.;


RUN;
/* FIN PROGRAMA: Microdatos en SAS: EILU_GRAD_2019.sas*/
