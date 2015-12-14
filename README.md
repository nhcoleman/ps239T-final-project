
## Short Description

	For my final project I downloaded a selectiong of New York Times articles on three contemporary whistleblowers/leakers from LexisNexis. Python was used for data collection and R for preprocessing and analysis. I installed the dplyr, plyr, ggplot2 and venn-diagram packages to complete these tasks. I determined the number of articles on each in the dataset, overlap of coverage, and coverage of each over time and created visualizations. 
	I used dplyr for data preparation and pipes. I loaded by five separate datasets (Assange, Manning, Snowden1, Snowden2, and Snowden3) then subset the data into my desired columns (Publication, Date, Title, Byline, Publication.Type, Document.Type, Section and Text) and added a column for the name of the person/name of the file the article came from.  After this process I bound all of the files together, got rid of duplicates, articles on football (Eli Manning), web blogs, OpEds and other opinion pieces, movie reviews, and book reviews then did a count of how many articles remained. As overlap in coverage is important to my research I also created a column for each whistleblower that I populated with a 1 if the article had their name in it or a 0 if there name did not appear and a final colum with the sum of the three person named columns which shows the total number of whistleblowers appearing in each article.  I chose this binary approach to aid in the creation of my venn diagram later.  Finally, I exported the csv file.
	With regards to analysis, I chose to create two graphs and a venn diagram. I used the plyr, ggplot2 and venn diagram packages. The first graph represented the number of articles on each whistleblower as determined by the article being assigned to them in my original search. I created a new variable with information on articles by person and date and then represented that information in a bar graph.  The previously mentioned binary coded information on each whistleblower was used in second visualization, a venn diagram which presented the presence of multiple whistleblowers in on article.  I utlized the venn diagram package for this endeavor, plotting the appearance of each of the three in a series of overlapping circles.  The end result showed only 7 articles of the 1043 that contained all three of their names.  Finally, I represented the presence of each whistleblower from 2010-2014 on a graph.  Due to the over 600 distinct dates the information is somewhat compressed but what is evident is that there are feasts and famines with regards to coverage each of them although less so with Snowden.  This graph also does a good job of showing overlap (as with the venn diagram).  The overlap is represented by lines that connect and are different colors or lines that overlap.
	


## Dependencies

For my project I used the following programs:

Python 2.7.10 :: Anaconda 2.3.0 (64 bit)
Rx64 3.2.2



## Files


### Data

LexisNexis' Terms of use prevent me from posting my data set.

1.  GRANT OF RIGHTS; RESTRICTIONS ON USE
1.1 You and your Authorized Users (defined below in Section 2.1) are granted a nonexclusive, nontransferable, limited right to access and use for research purposes the Online Services and Materials made available to you. The rights granted to each Authorized User are as follows: 

(a) The right to electronically display Materials retrieved from the Online Services for the Authorized Userôs individual use (e.g., no Authorized User may network others via LANs, WANs, intranets or the Internet), subject to the  Supplemental Terms for Specific Materials (Supplemental Termsù). Notwithstanding the foregoing, an Authorized User may display a de minimis amount of the Materials on an incidental, infrequent basis for non-commercial purposes to other Authorized Users so long as the Authorized Users are in the same physical location and the mode of display is not through the Internet, an intranet or other types of networking communication like LANs or WANs;

(full terms of use appear in data folder)

### Code

1. 01_Collect-NYT_Final.ipynb: Collects five text files from LexisNexis and exports data to five CSV files.
2.02_Clean_Categorize_Merge_Data_Final: Loads, cleans, and merges the five raw datasets into the final dataset.
2. 03_Analysis_Final: Conducts descriptive analysis of the data, producing the visualizations (graphs and venn diagram) found in the Results directory.

### Results

1. 01-articles-over-time.png: Graphs the number of articles about each person over time.
2. 02-articles-per-person.png: Bar graph shows the number of articles by person in the dataset.  
3. 03-coverage-overlap-venn-diagram.tiff: Venn diagram shows the overlap in coverage by person in the dataset.

## More Information

Many thanks and appreciation for the support, help, and encouragement from Rochelle Terman, Mobin Javed Mukhtar, Elizabeth McKenna, Amanda Lee, and Joshua Dyck.  


Naniette Coleman
PhD Student, Sociology
University of California, Berkeley
nhcoleman@berkeley.edu

