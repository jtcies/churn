#!/bin/bash

kaggle datasets download -d blastchar/telco-customer-churn -p data

unzip data/telco-customer-churn -d data