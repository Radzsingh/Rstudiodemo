# Dealing with Diabetes Dataset

#read the csv
diabetes_data <- read.csv('diabetes.csv', na = "")
str(diabetes_data)
dim(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)
diabetes_data[!complete.cases(diabetes_data),]

# orwe can do it in another way

library(mice)
md.pattern(diabetes_data)

summary(missing_values)


converted_date <- paste(diabetes_data$Month, diabetes_data$Year, sep= "/")
converted_date

diabetes_data$Date <- as.Date(converted_date, "%d/%m/%Y")
str(diabetes_data)
diabetes_data$Status <- factor(diabetes_data$Status, order=FALSE, levels = c("Poor", "Improved", "Excellent"))
summary(diabetes_data)
plot(diabetes_data$Status)

#Add titles to the chart
plot(diabetes_data$Status, main="Diabetes Status",
     xlab="Status",
     ylab="Number of People")

write.csv(diabetes_data, file="diabetes_data_modified.csv")
