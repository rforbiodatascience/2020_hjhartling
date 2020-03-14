# Clear workspace
# ------------------------------------------------------------------------------
rm(list = ls())

# Load libraries
# ------------------------------------------------------------------------------
install.packages("tidyverse")
install.packages("usethis")
library(usethis)
install.packages("devtools")
library("devtools")
install_github("ramhiser/datamicroarray")

library("tidyverse")
library("datamicroarray")

# Define functions
# ------------------------------------------------------------------------------
source(file = "R/99_project_functions.R")

# Load data
# ------------------------------------------------------------------------------
data('gravier', package = 'datamicroarray')
set.seed(676571)
cancer_data=mutate(as_tibble(pluck(gravier,"x")),y=pluck(gravier,"y"),pt_id=1:length(pluck(gravier, "y")),age=round(rnorm(length(pluck(gravier,"y")),mean=55,sd=10),1))
cancer_data=rename(cancer_data,event_label=y)
cancer_data$age_group=cut(cancer_data$age,breaks=seq(10,100,by=10))

select(slice(cancer_data,1:8),pt_id,age,age_group,event_label,1:5)


# Wrangle data
# ------------------------------------------------------------------------------
my_data <- my_data_raw # %>% ...

# Write data
# ------------------------------------------------------------------------------
write_tsv(x = my_data,
          path = "data/01_my_data.tsv")