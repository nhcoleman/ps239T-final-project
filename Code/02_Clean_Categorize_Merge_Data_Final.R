#NANIETTE H. COLEMAN
#FINAL PROJECT
#PS239T
#02_Merge_Data_Final


#SETUP ENVIRONMENT

#Remove all objects
rm(list=ls())

#Set working directory
setwd("C:/Users/naniettecoleman/desktop/Naniette_Final_Template")

#Install and load  packages
install.packages("dplyr")
library(dplyr) # Data preparation and pipes $>$

#Load data
Assange <- read.csv("Data/Assange.csv", stringsAsFactors = FALSE)
Manning <- read.csv("Data/Manning.csv", stringsAsFactors = FALSE)
Snowden1 <- read.csv("Data/Snowden1.csv", stringsAsFactors = FALSE)
Snowden2 <- read.csv("Data/Snowden2.csv", stringsAsFactors = FALSE)
Snowden3 <- read.csv("Data/Snowden3.csv", stringsAsFactors = FALSE)

#Subset 
Assange <- subset(Assange,select=c(PUBLICATION,DATE,TITLE,BYLINE,LENGTH,PUBLICATION.TYPE,DOCUMENT.TYPE,SECTION,TEXT))
Manning <- subset(Manning,select=c(PUBLICATION,DATE,TITLE,BYLINE,LENGTH,PUBLICATION.TYPE,DOCUMENT.TYPE,SECTION,TEXT))
Snowden1 <- subset(Snowden1,select=c(PUBLICATION,DATE,TITLE,BYLINE,LENGTH,PUBLICATION.TYPE,DOCUMENT.TYPE,SECTION,TEXT))
Snowden2 <- subset(Snowden2,select=c(PUBLICATION,DATE,TITLE,BYLINE,LENGTH,PUBLICATION.TYPE,DOCUMENT.TYPE,SECTION,TEXT))
Snowden3 <- subset(Snowden3,select=c(PUBLICATION,DATE,TITLE,BYLINE,LENGTH,PUBLICATION.TYPE,DOCUMENT.TYPE,SECTION,TEXT))

#Add Person column and populate withe name of WB
Assange$PERSON <- "Assange"
Manning$PERSON <- "Manning"
Snowden1$PERSON <- "Snowden"
Snowden2$PERSON <- "Snowden"
Snowden3$PERSON <- "Snowden"

#Bind all of the csv files together
whistleblowers <- rbind(Assange, Manning, Snowden1, Snowden2, Snowden3)

#Get rid of duplicates
x <- whistleblowers[, c("DATE", "TITLE")]
x <- which(duplicated(x))
whistleblowers <- whistleblowers[-x,]

#Get rid of Football articles
Eli <- grep("football",whistleblowers$TEXT,ignore.case=T)
whistleblowers <- whistleblowers[-Eli,]

#Get rid of Web Blogs
Web_Blogs <- grep("Web Blog",whistleblowers$PUBLICATION.TYPE,ignore.case=T)
whistleblowers <- whistleblowers[-Web_Blogs,]

#Get rid of OpEds
OpEd <- grep("OpEd",whistleblowers$SECTION,ignore.case=T)
whistleblowers <- whistleblowers[-OpEd,]

#Get rid of OPINION pieces
OPINION <- grep("OPINION",whistleblowers$SECTION,ignore.case=F)
whistleblowers <- whistleblowers[-OPINION,]

#Get rid of Movie Reviews
Movies <- grep("Movies",whistleblowers$SECTION,ignore.case=T)
whistleblowers <- whistleblowers[-Movies,]

#Get rid of Book Reviews
Letters <- grep("LETTER",whistleblowers$SECTION,ignore.case=F)
whistleblowers <- whistleblowers[-Letters,]

#Take a look at the number of articles remaining
whistleblowers$PERSON <- as.factor(whistleblowers$PERSON)
summary(whistleblowers$PERSON)

#Create columns for each WB = 0
whistleblowers$SNOWDEN <- 0
whistleblowers$MANNING <- 0
whistleblowers$ASSANGE <- 0

#Assign 1 to column for person if article has them in it
snow <- grep("Snowden", whistleblowers$TEXT, ignore.case = T)
whistleblowers$SNOWDEN[snow] <- 1

ass <- grep("Assange",whistleblowers$TEXT, ignore.case = T)
whistleblowers$ASSANGE[ass] <- 1

man <- grep("Manning",whistleblowers$TEXT, ignore.case = T)
whistleblowers$MANNING[man]<- 1

#Create Column and sum up the number of whistleblowers that appear in each article
whistleblowers$number.people <- whistleblowers$SNOWDEN + whistleblowers$MANNING + whistleblowers$ASSANGE

#Export CSV 
write.csv(whistleblowers,"Data/whistleblowers-FINAL.csv",row.names = FALSE, na="")


