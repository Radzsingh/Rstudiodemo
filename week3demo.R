#file downloaded from baclkboard loaded into df
# missing data replaced by NA
managers_data <- read.csv("managers.csv", na= "")

#view the structure of the datafrmae
str(managers_data)

# Convert date to a date variable
# It is currently in mm/dd/yy
converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date
str(converted_date)
managers_data$Date <- converted_date
managers_data

#convert age variable to int
managers_data$Age <- as.integer(managers_data$Age)
managers_data
str(managers_data)

# Select records within 15-10-18 and 01-11-18
start_date <- as.Date("2018-10-15")
end_date <- as.Date("2018-11-01")
new_date <- managers_data[
  managers_data$Date >= start_date & 
    managers_data$Date <= end_date,]
new_date

# drop attributes (var) from data
#SHOWS EHRE SPECIFIC VALUES ARE
include_list <- names(managers_data) %in% c("Q3", "Q4")
include_list

#This data frame only contain q3 and q4
new_managers <- managers_data[include_list]
new_managers
str(new_managers)

# using the subset function
# to extract all records where age > 35 or age <24
# Only select Q1-Q4

attach(managers_data)
new_data <- subset(
  managers_data, Age > 35 | Age < 24,
  select = c(Age, Q1,Q2,Q3,Q4))
new_data 

#select a subset of managers_data
#where gender=M and age>25. Only show records
#from gender to q4 inclusive

gender_data <- subset( managers_data, Age > 25 & Gender == 'M', select = Gender:Q4)
gender_data 

detach(managers_data)

#Random sampling
#sample 3 records from the managers dataframe

my_sample <- managers_data[sample(1:nrow(managers_data),3, replace = FALSE),]
my_sample

# CAN WE EXTRACT 10 SAMPLES?
my_sample <- managers_data[sample(1:nrow(managers_data),10, replace = TRUE),]
my_sample

# sroting data by age
attach(managers_data)
new_data <- managers_data[order(Age),]
new_data

# Sort by gender and age within same gender
sorted_data <- managers_data[order(Gender, Age),]
sorted_data

# Save the random sample dataset to the csv file
my_sample
write.csv(my_sample, file= "random_sample.csv")













