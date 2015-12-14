#NANIETTE H. COLEMAN
#FINAL PROJECT
#PS239T
#03_Analysis_Final


#SETUP ENVIRONMENT

#Remove all objects
rm(list=ls())

#Set working directory
setwd("C:/Users/naniettecoleman/desktop/Naniette_Final_Template")

#Install and load packages
install.packages("VennDiagram")
install.packages("ggplot2")
install.packages("plyr")
library(VennDiagram)
library(ggplot2)
library(plyr)

#Read in the data
articles <-read.csv("Data/whistleblowers-FINAL.csv", header=TRUE, stringsAsFactors = F)

#EXAMINE MY DATA

#Take a look at all of the column headings in my file
names(articles)

#Get a count of how many unique dates are covered in the data 
length(unique(articles$DATE))

#Take a look at the data sorted by date and also by person
sort(unique(articles$DATE))
sort(unique(articles$PERSON))

#PREPARE THE DATA

#Counting Frequencies of articles per person)
articles.person.date<-count(articles, c('PERSON', 'DATE'))
names(articles.person.date) <-c("PERSON", "DATE", "REPORTS")


#Group-wise Operations and Plotting 
n.person <- ddply(.data=articles.person.date, .variables=.(PERSON), .fun= summarize, count = sum(REPORTS, na.rm=T))
n.person

#CREATE GRAPHS AND VENN DIAGRAM

#Barplot illustrating how many articles there are per person
barplot(n.person$count, names.arg = n.person$PERSON,xlab="Person",ylab="Number of Articles")

#Venn Diagram showing overlap of coverage of three whistleblowers
snowden = which(articles$SNOWDEN==1)
snowden

assange = which(articles$ASSANGE==1)
assange

manning =which(articles$MANNING==1)
manning

venn.plot <- venn.diagram (list(SNOWDEN = snowden, ASSANGE = assange, MANNING = manning),"Venn_3set_simple.tiff")


#Graph showing the number of articles by person over time

#make data
n.person.date <- ddply(.data = articles.person.date, .variables = .(DATE, PERSON), .fun=summarize, "count" = sum(REPORTS, na.rm = T))
summary(n.person.date)

#Put all of the dates in order 
n.person.date[order(as.Date(n.person.date$DATE, format="%m/%Y")),]

#Plot
require(ggplot2)
ggplot(data=n.person.date, aes(x=DATE,y=count, group=1, color=PERSON)) + geom_line() + labs(x = "2010-2014", y = "Number of Articles by WB")






