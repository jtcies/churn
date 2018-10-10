library(tidyverse)
library(here)
library(survival)
library(survminer)
library(jtcr)

dat <- read_csv(here::here("data/processed/churn_data_cleaned.csv")) %>%
  fix_names()

dat <- dat %>%
  mutate(
    churn = if_else(churn == "Yes", 1L, 0L),
    charges_bucket = cut(monthlycharges, 4)
  )


# survival analysis
surv_object <- Surv(time = dat$tenure, event = dat$churn)

model <- survfit(surv_object ~ partner, data = dat)

ggsurvplot(model)
