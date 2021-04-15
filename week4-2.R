# Dealing with Diabetes Dataset

#read the csv
diabetes_data <- read.csv('Diabetes-md.csv', na = "")
str(diabetes_data)
dim(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)
diabetes_data[!complete.cases(diabetes_data),]

# orwe can do it in another way

library(mice)
md.pattern(diabetes_data)

summary(missing_values)
