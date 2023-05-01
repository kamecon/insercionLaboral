
# Load libraries ----------------------------------------------------------

library(tidyverse)
library(haven)
library(stargazer)
library(magrittr)


# Import data -------------------------------------------------------------

read_data <- function(df)
{
  full_path <- paste("https://github.com/scunning1975/mixtape/raw/master/", 
                     df, sep = "")
  df <- read_dta(full_path)
  return(df)
}


# Simple difference in outcomes (SDO) -------------------------------------

titanic <- read_data("titanic.dta") %>% 
  mutate(d = case_when(class == 1 ~ 1, TRUE ~ 0))

ey1 <- titanic %>% 
  filter(d == 1) %>%
  pull(survived) %>% 
  mean()

ey0 <- titanic %>% 
  filter(d == 0) %>%
  pull(survived) %>% 
  mean()

sdo <- ey1 - ey0


# Subclassification weighting ---------------------------------------------

titanic %<>%
  mutate(s = case_when(sex == 0 & age == 1 ~ 1,
                       sex == 0 & age == 0 ~ 2,
                       sex == 1 & age == 1 ~ 3,
                       sex == 1 & age == 0 ~ 4,
                       TRUE ~ 0))


## Book option -------------------------------------------------------------

ey11 <- titanic %>% 
  filter(s == 1 & d == 1) %$%
  mean(survived)

ey10 <- titanic %>% 
  filter(s == 1 & d == 0) %$%
  mean(survived)

ey21 <- titanic %>% 
  filter(s == 2 & d == 1) %$%
  mean(survived)

ey20 <- titanic %>% 
  filter(s == 2 & d == 0) %$%
  mean(survived)

ey31 <- titanic %>% 
  filter(s == 3 & d == 1) %$%
  mean(survived)

ey30 <- titanic %>% 
  filter(s == 3 & d == 0) %$%
  mean(survived)

ey41 <- titanic %>% 
  filter(s == 4 & d == 1) %$%
  mean(survived)

ey40 <- titanic %>% 
  filter(s == 4 & d == 0) %$%
  mean(survived)

diff1 = ey11 - ey10
diff2 = ey21 - ey20
diff3 = ey31 - ey30
diff4 = ey41 - ey40

obs = nrow(titanic %>% filter(d == 0))

wt1 <- titanic %>% 
  filter(s == 1 & d == 0) %$%
  nrow(.)/obs

wt2 <- titanic %>% 
  filter(s == 2 & d == 0) %$%
  nrow(.)/obs

wt3 <- titanic %>% 
  filter(s == 3 & d == 0) %$%
  nrow(.)/obs

wt4 <- titanic %>% 
  filter(s == 4 & d == 0) %$%
  nrow(.)/obs

wate = diff1*wt1 + diff2*wt2 + diff3*wt3 + diff4*wt4

stargazer(wate, sdo, type = "text")

### My option 01 (incomplete) -----------------------------------------------

lista <- list()
for (i in titanic$s %>% unique()) {
  for (j in titanic$d %>% unique()) {
    lista[[paste0(as.character(i),as.character(j))]] <-  titanic %>% 
      filter(s == i & d == j) %$%
      mean(survived)
  }
}

### My option 02 ------------------------------------------------------------

combSexAgeClass <- expand.grid(unique(titanic$s), unique(titanic$d))

meanClasses <- function(i, j){
  titanic %>% 
    filter(s == i & d == j) %$%
    mean(survived)
}

notFirstClass <- function(i){
  titanic %>% 
    filter(s == i & d == 0) %$%
    nrow(.)/obs
}

wate2 <- map(.x = unique(titanic$s) %>% sort, .f = ~notFirstClass(.x)) %>% 
  unlist() %>% 
  bind_cols(map2(.x = combSexAgeClass$Var1,
                 .y = combSexAgeClass$Var2,
                 .f = ~meanClasses(i = .x, j = .y)) %>% 
              unlist() %>% 
              bind_cols(combSexAgeClass, .name_repair = "minimal") %>%
              rename(ey="")%>% 
              group_by(Var1) %>% 
              summarise(diff(ey)*-1)) %>% 
  select(-Var1) %>% 
  `colnames<-`(c("wt","diff")) %>% 
  mutate(wateTemp=wt*diff) %>% 
  summarise(wate=sum(wateTemp)) %>% 
  pull()

