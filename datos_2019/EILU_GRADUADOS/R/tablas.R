
# Load libraries and files ------------------------------------------------

pacman::p_load(tidyverse, data.table, stargazer, weights, gtsummary, srvyr, survey, gt)

load("datos19.RData")

EILU2019dt <- as.data.table(fichero_salida)


# Weigthed one way tables -------------------------------------------------

#Sueldo mensual neto del primer trabajo o de su empleo actual en el momento en el que empezó
wpct(EILU2019dt[PR_SUELDO %in% 1:9, PR_SUELDO],
     EILU2019dt[PR_SUELDO %in% 1:9, FACTOR]) %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  `colnames<-`(c("Sueldo", "Proporción")) %>% 
  stargazer(summary = FALSE,
            rownames = FALSE,
            title = "Sueldo mensual neto (frecuencia)", 
            notes = "Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.",
            out = "./Tables/sueldoProp.tex" )

#Tipo de Universidad
wpct(EILU2019dt[, T_UNIV],
     EILU2019dt[, FACTOR]) %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  `colnames<-`(c("Sueldo", "Proporción")) %>% 
  stargazer(summary = FALSE,
            rownames = FALSE,
            title = "Tipo de universidad (frecuencia)", 
            notes = "Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.",
            out = "./Tables/univProp.tex" )

#Rama de conocimiento
wpct(EILU2019dt[, RAMA],
     EILU2019dt[, FACTOR]) %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  `colnames<-`(c("Rama de conocimiento", "Proporción")) %>% 
  stargazer(summary = FALSE,
            rownames = FALSE,
            title = "Rama de conocimiento (frecuencia)", 
            notes = "Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.",
            out = "./Tables/ramaProp.tex" )

#Situación laboral actual
wpct(EILU2019dt[, TRBPRN1],
     EILU2019dt[, FACTOR]) %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  `colnames<-`(c("Situación laboral", "Proporción")) %>% 
  stargazer(summary = FALSE,
            rownames = FALSE,
            title = "Situación laboral actual (frecuencia)", 
            notes = "Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.",
            out = "./Tables/laboralProp.tex" )

#Se hace uso en el trabajo actual de los conocimientos y habilidades adquiridos en estos estudios
wpct(EILU2019dt[TR_D21 %in% c(1,2,9), TR_D21],
     EILU2019dt[TR_D21 %in% c(1,2,9), FACTOR]) %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  `colnames<-`(c("Aprovechamiento", "Proporción")) %>% 
  stargazer(summary = FALSE,
            rownames = FALSE,
            title = "Aprovechamiento de los Estudios (frecuencia)", 
            notes = "Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.",
            out = "./Tables/aprovProp.tex" )

# Weigthed two way tables -------------------------------------------------

#Convertimos los datos a un objeto survey para poder trabajar con gt summary
EILU2019Survey <- survey::svydesign(~1,
                                    data = EILU2019dt,
                                    weights = ~FACTOR)

EILU2019SurveySalario <- survey::svydesign(~1,
                                    data = EILU2019dt[PR_SUELDO %in% 1:9],
                                    weights = ~FACTOR)

EILU2019SurveyAprovecha <- survey::svydesign(~1,
                                           data = EILU2019dt[TR_D21 %in% c(1,2,9)],
                                           weights = ~FACTOR)

## Situación laboral actual ------------------------------------------------

#Rama de conocimiento
EILU2019Survey %>% 
  tbl_svysummary(by = RAMA, percent = "column", include = TRBPRN1, label = list(TRBPRN1 ~ "Situación laboral actual")) %>% 
  modify_header(label = "**Rama de estudio**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Rama de Estudio vs. Situación de Empleo") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/RamaEmpleo.tex")

EILU2019Survey %>% 
  tbl_svysummary(by = T_UNIV, percent = "column", include = TRBPRN1, label = list(TRBPRN1 ~ "Situación de empleo")) %>% 
  modify_header(label = "**Tipo de Universidad**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Tipo de Universidad vs. Situación de Empleo") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/UnivEmpleo.tex")

EILU2019Survey %>% 
  tbl_svysummary(by = SEXO, percent = "column", include = TRBPRN1, label = list(TRBPRN1 ~ "Situación de empleo")) %>% 
  modify_header(label = "**Género**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Género vs. Situación de Empleo") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/SexoEmpleo.tex")

#Tipo de universidad

EILU2019SurveySalario %>% 
  tbl_svysummary(by = T_UNIV, percent = "column", include = PR_SUELDO, label = list(PR_SUELDO ~ "Sueldo")) %>% 
  modify_header(label = "**Tipo de universidad**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Tipo de universidad vs Salario") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/SalarioUniv.tex")

EILU2019Survey %>% 
  tbl_svysummary(by = T_UNIV, percent = "column", include = TRBPRN1, label = list(TRBPRN1 ~ "Situación laboral")) %>% 
  modify_header(label = "**Tipo de universidad**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Tipo de universidad vs Situación laboral") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/LaboralUniv.tex")

EILU2019SurveyAprovecha %>% 
  tbl_svysummary(by = T_UNIV, percent = "column", include = TR_D21, label = list(TR_D21 ~ "Aprovechamiento")) %>% 
  modify_header(label = "**Tipo de universidad**") %>% 
  modify_footnote(update = everything() ~ NA) %>% 
  as_gt() %>% 
  tab_header(title = "Tipo de universidad vs Aprovechamiento de los estudios") %>% 
  tab_source_note("Fuente = Encuesta de inserción laboral de los titulados universiatrios 2019, INE.") %>% 
  gtsave(filename = "./Tables/AprovechaUniv.tex")




# Pruebas con otros paquetes ----------------------------------------------

xtabs(FACTOR ~ TRBPRN1 + RAMA, EILU2019dt) %>%
  prop.table(margin = 2) %>%
  addmargins(margin = 1) %>% 
  format(justify="centre", digits = 2) %>% 
  stargazer()


EILU2019dt %>% 
  tbl_cross(row = TRBPRN1, col = RAMA, percent = "cell") 






  