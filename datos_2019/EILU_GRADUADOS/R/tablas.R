
# Load libraries and files ------------------------------------------------

pacman::p_load(tidyverse, data.table, stargazer, weights, gtsummary, srvyr)

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

xtabs(FACTOR ~ TRBPRN1 + RAMA, EILU2019dt) %>%
  prop.table(margin = 2) %>%
  addmargins(margin = 1) %>% 
  format(justify="centre", digits = 2) %>% 
  stargazer()

EILU2019dt %>% 
  as_survey_design(.data = EILU2019dt, weight = FACTOR) %>%
  tbl_strata(
    strata = RAMA,
    ~.x %>% 
  tbl_svysummary(
    missing="no",
    by = TRBPRN1,
    include=weight,
    percent="row"
  )) #%>%
  as_gt()
  
  EILU2019dt %>% 
  tbl_cross(row = TRBPRN1, col = RAMA, percent = "cell") 

  
  survey::svydesign(~1, data = EILU2019dt, weights = ~FACTOR) %>%
    # summarize weighted data
    tbl_svysummary(by = RAMA, percent = "cell")
  