############################################
# Unit04 Q1 - MSDS 6306 - Muthu Palanisamy #
############################################
library(fivethirtyeight)

# Assign 18th Dataset to df.
df<-college_recent_grads

# Following Vignette lists out the datasets with additional details
# like Dataframe Name, Article Title, Author, Date and URL
# vignette("fivethirtyeight", package = "fivethirtyeight")
# Retrieve the details which is stored in the below link as CSV.

datasets <- read.csv("https://goo.gl/OT8iHa")

# college_recent_grads URL stored in 16th position
datasets$ARTICLE_URL[16]

# Get the Dimension & Column Names
dim(college_recent_grads)
names(college_recent_grads)

library(plyr)
major_count <- count(college_recent_grads, "major_category")
major_count

par(mar=c(5, 12, 4 ,2), lwd=2)
barplot(major_count$freq, horiz=TRUE, ylab='', xlab='Frequency',
        main='Major Categories & the Frequencies',
        col=c('yellowgreen','blueviolet','darkturquoise','tomato',
              'thistle','tan','steelblue','springgreen',
              'gold','sandybrown','tomato','midnightblue',
              'peru','plum'),names.arg=major_count$major_category, 
        las=1,cex.names = 0.8)

write.csv(df, file = "MyData.csv")