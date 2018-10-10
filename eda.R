library(tidyverse)
library(here)
library(jtcr)

dat <- read_csv(here::here("/data/WA_Fn-UseC_-Telco-Customer-Churn.csv")) %>%
  fix_names()

glimpse(dat)

# missingness
total_missing(dat)

count_all(dat)

