library(caret)
library(pROC)
library(tidyverse)
library(here)

train <- read_csv(here::here("data/processed/train.csv"))

xgbGrid <- expand.grid(
  nrounds = c(1, 10),
  max_depth = c(1, 4),
  eta = c(.1, .4),
  gamma = 0,
  colsample_bytree = .7,
  min_child_weight = 1,
  subsample = c(.8, 1))
)

xgbCntrl <- trainControl(
  
)