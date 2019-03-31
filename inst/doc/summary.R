## ----setup, include = FALSE----------------------------------------------
library(nhds)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----adult---------------------------------------------------------------
nhds_adult()[1:5, 1:7]

## ----peds----------------------------------------------------------------
nhds_pediatric()[11:20, c("age_unit", "age")]
nhds_pediatric()[1:5, 1:7]

## ----infants-------------------------------------------------------------
nhds_infant()[111:115, 1:7]

## ----infvsneo------------------------------------------------------------
i <- nhds_infant()
nrow(i[i$age_unit == "days" & i$age > 28, ])
nhds_infant_not_neonate()[1:5, 1:7]

## ----neo-----------------------------------------------------------------
nhds_neonatal()[which(!(nhds_neonatal()$marital_status %in% c("single", "not_stated"))), 1:7]
nhds_neonatal_not_newborn()[1:5, 1:7]

## ----newb----------------------------------------------------------------
nhds_newborn()[1:5, 1:7]

## ----barplot, echo = FALSE, fig.width=7, fig.height = 7------------------
barplot(las = 2, c(
  adult = nrow(nhds_adult()),
  pediatric = nrow(nhds_pediatric()),
  infant = nrow(nhds_infant()),
  "infant,\n not\n neonate" = nrow(nhds_infant_not_neonate()),
  neonate = nrow(nhds_neonate()),
  "neonate,\n not\n newborn" = nrow(nhds_neonate_not_newborn()),
  newborn = nrow(nhds_newborn())
))

## ----summary-------------------------------------------------------------
summary(nhds2010)

