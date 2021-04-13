
# Merging Datasets


new_managers_data <- read.csv("MoreData.csv", na= "")
managers_data <- read.csv("managers.csv", na= "")
#view the structure of the dataframe
str(new_managers_data)
str(managers_data)

# Show the headers from both data frames
names(managers_data)
names(new_managers_data)

include_list <- new_managers_data[c("Date", "Country", "Gender", "Age",
  "Q1", "Q2","Q3", "Q4","Q5")]
include_list
rbind(managers_data, include_list)

#create new AgeCat variable in include lists and then caclulate the values
attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[Age >= 26 & Age <=44] <- "Middle Aged"
include_list$AgeCat[Age < 25] <- "Young"

# If NA is found, categorize as "Elder"
include_list$AgeCat[is.na(Age)] <- "Elder"
detach(include_list)
include_list

modified_managers <- managers_data[2:11]

modified_managers

#Update dates of both dataframes 
converted_date <- as.Date(modified_managers$Date, "%m/%d/%y")
modified_managers$Date <- converted_date

modified_managers

converted_date <- as.Date(include_list$Date, "%m/%d/%")
include_list$Date <- converted_date
include_list

#combine dataframes
combined_managers <- rbind(modified_managers, include_list)

# set AgeCat with ordered factor
# so that young < middle aged < elder
combined_managers <- factor(combined_managers$AgeCat, levels= c("Young", "Middle Aged", "Elder"), ordered= TRUE)
str(combined_managers)


