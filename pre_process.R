library(tidyverse)
library(here)
library(jtcr)

dat <- read_csv(here::here("/data/WA_Fn-UseC_-Telco-Customer-Churn.csv")) %>%
  fix_names()

# remove missing total charges

dat_clean <- dat %>%
  filter(!is.na(totalcharges))

# split test and train ------------

set.seed(2018)
split <- sample(c(TRUE, FALSE), 
                replace = TRUE, 
                nrow(dat_clean), 
                prob = c(0.75, 0.25))
train <- dat_clean[split, ]
test <- dat_clean[!split, ]



# write --------

write_csv(dat_clean, here::here("data/processed/churn_data_cleaned.csv"))
write_csv(train, here::here("data/processed/train.csv"))
write_csv(test, here::here("data/processed/test.csv"))