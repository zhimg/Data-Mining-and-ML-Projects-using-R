library(tidyverse)
library(Amelia)

cropDF <- read.csv("apy.csv")
str(cropDF)
sum(is.na(cropDF))
# As there are 3730 NA values and we have large number of records , we can easily remove them.
cropDF <- na.omit(cropDF)
# Check miss map values
#missmap(cropDF)
# Remove Distict coloumn name as it would not be contributed in the final model
cropDF <- select(cropDF,-c(State_Name))
# Area and Production are on different scale, so need to normalize them
# Selecting four crops for the same
# Rice , Turmeric , Banana , Sugarcane
cropDF <- filter(cropDF , Crop == "Rice" | Crop == "Banana" | Crop == "Turmeric" | Crop == "Sugarcane")
unique
nrow(cropDF)
#install.packages("BBmisc")
library(BBmisc)
normalize(cropDF, method = "standardize", range = c(0, 1), margin = 1L, on.constant = "quiet")
str(cropDF)
scatter.smooth(x=cropDF$Production, y=cropDF$Crop_Year , main="Production ~ Crop_Year")

