# MSDS 6306 - Unit05 #
# Muthu Palanisamy   #

# Data munging..
# Import yob2016 file
df<-read.delim('yob2016.txt', sep=";" , header=FALSE)

# Set the names of the columns
names(df)<-c("Name","Sex","Count")

# Convert the fields Name & Sex to character (from factor)
df$Name<-as.character(df$Name)
df$Sex<-as.character(df$Sex)

# Summary & Structure of the data frame
summary(df)
str(df)

# Delete the misspelled Name
MisspelledName = grep("yyy$",df$Name,value="TRUE")
MisspelledName
# Deleted Misspelled name
y2016<-df[(-1 * which(df$Name == grep("yyy$",df$Name,value="TRUE"))),]

# Data Merging

# Import yob2015 file
y2015<-read.delim("yob2015.txt",sep=',',header=FALSE)

# Set the names of the columns
names(y2015)<-c("Name","Sex","Count")

# Convert the fields Name & Sex to character (from factor)
y2015$Name<-as.character(y2015$Name)
y2015$Sex<-as.character(y2015$Sex)

# Summary & Structure of the data frame
summary(y2015)
str(y2015)

# Display last 10 row.
tail(y2015,10)

# Observation: 
# All the names were given to boys (bottom 10)
# with 5 childrens given same name

# Merge 2015 & 2016
mergedData<-merge(y2015, y2016, by = "Name", all = TRUE)
mergedData$Count.x[is.na((mergedData$Count.x))]<-0
mergedData$Count.y[is.na((mergedData$Count.y))]<-0

# Data Summary
# Sumup the total count.
mergedData$Total<-mergedData$Count.x + mergedData$Count.y

# Take the subset of girchild names
final<-subset(mergedData, Sex.x=="F" & Sex.y == "F")
final<-final[order(final$Total, decreasing = TRUE),]

# Store the first 10 names in csv
finalcsv<-final[1:10, c(1,6)]
finalcsv

write.csv(finalcsv, file="itsagirl.csv")
