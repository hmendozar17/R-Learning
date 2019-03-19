########################  R for begginers############################################
# Author: Henry Mendoza Rivera 
#####################################################################################

#######################################################################################
#                      How to install R?                                              #
#######################################################################################

#\begin{enumerate}
#go to https://www.r-project.org/
# choose your preferred CRAN mirror.
# select USA : https://cran.cnr.berkeley.edu/
# Download R according your Operation System
#\Select the latest release, for example R-3.5.2.pkg
# Follow the steps to install R
#######################################################################################
#                      How to install RStudio?                                              #
#######################################################################################
# Go to http://www.rstudio.com/
# Select Download the free version
# Select the installer, For example : RStudio 1.1.463 - Mac OS X 10.6+ (64-bit) 
# Follow the steps for installation.

#############################################################################
#                            How to update R?                               #
#############################################################################
  #1. Install the new R version
  #2. Copy any installed file from the older library in the last version to the new folder library in the new R version
  #3. run the code: update.packages(checkBuilt=TRUE, ask=FALSE)
  #reference: http://cran.r-project.org/bin/windows/base/rw-FAQ.html#What_0027s-the-best-way-to-upgrade_003f

# Set the working directory
#############################################################################
#                            How to Set Working Directory in R?                               #
#############################################################################
getwd()  # to know the actual directory
setwd("C:/Documents and Settings/Data") # # Set the working directory
sessionInfo() # Collect Information About The Current R Session
#Print version information about R, the OS and attached or loaded packages.
#############################################################################
#                            How to install packages?                       #
#############################################################################

install.packages("gapminder") # install, the package gapminder
library(gapminder)
# install multiple packages at once
install.packages(pkgs = c("dplyr", "ggplot2", "ggformula","mosaic", "supernova", "lsr","Lock5Data", "Lock5withR",
                          "okcupiddata", "dslabs","fivethirtyeight"))

#########################################################################
#               Before to start                                         #
#########################################################################
#R is object oriented language

# > simbol (o prompt) del sistema
# + mean incomplete order
# ; to separe to order in the same line
# , to separate argument inside parentheses
# # symbol used to make comementaries
# <- or  = operator for assignations.
  #For Example:
  # message<-"hello"
  #message
  #print(message)

# NOTE:R differentiate uppercase and lowercase letters.

###############################################################################################
#                                      comments in R                                          #
###############################################################################################

# the hastag symbol # is used beforme any commnet in R.

################################################################################
#                                 R as a calculator                            #
################################################################################

5 + 40  # # Addition

40-5  # substraction

5 * 40  # multiplication

40/5  # Division

4^2  # power

4**2 # power

sqrt(4) # the square root

log(10,base=exp(1)) # the log base e

log(10, base=10) # the log base 10

log10(10) # the log base 10

log2(32) # the log base 2

7+2+sqrt(49)-log10(100)


exp(1) #Exponential


20%%6  # congruence modulo.  el remainder when we devide 20 0ver 10, We said 20 is congruent with 2 module 6

1/0 # Inf

0/0 # NaN (indeterminado)

Inf*5 # Inf

###############################################################################################
#                                      Help with R                                            #
###############################################################################################


?lm # help for linear models


############################################################################
#        	creating data in R                                  					   #
############################################################################


##---------------- Type of data

#- Character:e.g. "Henry" 
#- Numeric: e.g. 3, 3.5 (or any real number)
#- Integer: e.g. 3 
#- Complex: e.g. 1+3i
#- Logical: e.g. TRUE (or T), FALSE (or F)
#- Null (empty object)



##---------------- VECTORES

##  c() # create vector with the same type.

#Suponga que se tiene los siguientes datos y se desea leer en R con la opci?n c().

age<-c(35,26,30,40,35,32,40,21,32,25)

weight.1<-c(70,74,75,66,74,66,75,80,90,85)

height<-c(180,190,180,160,160,165,180,165,170,210)

gender<-c("M","F","M","F","F","F","M","F","F","M")

stratum<-c("3","3","5","4","4","4","5","4","4","4")


###--- Tables with: data.frame ( different type of data)
# creates data frames, tightly coupled collections of variables which share many of the
#properties of matrices and of lists, used as the fundamental data structure by most of R's modeling software.

my.data<-data.frame(age,weight.1,height,gender,stratum)


head(my.data) # show the first 6 observations

tail(my.data) # show the last 6 observations

names(my.data)

ls() # only returns the names of objects in the environment in which it is called

rm(list=ls()) # removes all variables from the current environment

history() # hystory of all used commands

##renombrando los nombre de las variables

names(my.data)<-c("Var_1","Var_2","Var_3","Var_4","Var_5")

head(my.data)

##-- Mirando el tipo de dato

typeof(my.data) #[1] "list"      http://www.statmethods.net/input/datatypes.html


##-- Mirando la clase de los datos

class(my.data) # 


str(my.data) #data structure: IMPORTANT



##--- the mean function

mean(my.data$Var_1)

attach(my.data) # to only use the name of the variable

mean(Var_1)

detach(my.data)

mean(Var_1) # no trabaja

mean(my.data$Var_1)





###--------------the REP function

rep(3,12) #   replicates the values 3, twelve times
rep(seq(2,20,by=2),2) # replicates the sequence 2 4 6 8 10 12 14 16 18 20 two times
rep(c(1,4),c(3,2)) # repetir el primer elemento del  vector 3 veces y el segundo 2 vecees [1] 1 1 1 4 4
rep(c(1,4), each=3)#[1] 1 1 1 4 4 4






############################################################################
#        IMPORTING AND	READING DATA                           	           #
############################################################################

#The first option is using the: Import Dataset option in Rstudio
# But whe used R markdown you need to use one of the following options

read.table() #Reads a file in table format and creates a data frame from it
read.csv2()  #to create a data frame
data.frame() #to create a data frame
data.matrix()#to convert a data frame into matrix




########  rea.table()
#Used to store tabular data. It is a special type of LIST since it can contain
#vector of different type:each column can be a:numeric, factor, integer, logical

##---EXAMPLE (read.table() )

#Suppose that we have the following data :

#edad peso estatura sexo estrato
#35 70 180 M 3
#26 74 190 F 3
#30 75 180 M 5
#40 66 160 F 4
#35 74 160 F 4
#32 66 165 F 4
#40 75 180 M 5
#21 80 165 F 4
#32 90 170 F 4
#25 85 210 M 4

data.henry<-read.table(header=TRUE,text='
                        age weight.1 height gender stratum
                        35 70 180 M 3
                        26 74 190 F 3
                        30 75 180 M 5
                        40 66 160 F 4
                        35 74 160 F 4
                        32 66 165 F 4
                        40 75 180 M 5
                        21 80 165 F 4
                        32 90 170 F 4
                        25 85 210 M 4
                        ')
str(data.henry)

###########  DATABASES ONLINE

#reference http://mosaic-web.org/go/SM2-technique/data-in-r.html#preliminaries
require(mosaicData)
library(mosaicData)
names(mosaicData)
head(Galton)
######

Swim <- read.csv("http://tiny.cc/mosaic/swim100m.csv")
str(Swim)
head(Swim)
names(Swim)
summary(Swim)
nrow(Swim)
mean(~time, data = Swim)
min(~time, data = Swim)
mean( time~ sex, data = Swim )

#####
# 







# IMPORT DATA

# Read in csv files
df <- read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", 
                 header = FALSE,
                 sep = ",")

df <- read.csv("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv",
               header = FALSE)

df <- read.csv2("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", 
                
                

                header= FALSE)


############################################################################
#        CLEANING DATA                           	                         #
############################################################################


############################################################################
#        IMPORTING AND	READING DATA                           	           #
############################################################################


# install a single package
install.packages("dplyr")
# install multiple packages at once
install.packages(pkgs = c(
  "dplyr", "ggplot2", "ggformula",
  "mosaic", "supernova", "lsr",
  "Lock5Data", "Lock5withR",
  "okcupiddata", "dslabs",
  "fivethirtyeight"
))

library(dplyr)
library(ggplot2)
library(ggformula)
library(supernova)
library(lsr)

library(mosaic)  #  requiere to install: lattice,ggformula,ggplot2,ggstance

library(Lock5Data) # Datasets for "Statistics: Unlocking the Power of Data" 
#https://cran.r-project.org/web/packages/Lock5Data/index.html

library(Lock5withR)
library(okcupiddata)
library(dslabs)
library(fivethirtyeight)
#########
#http://mosaic-web.org/g

######## Checking data in a package
library(dplyr)
data(package = "dplyr")

############################################################################
#        DATA MANIPULATION                      	                         #
############################################################################

################################## : Data  Fingers
## documentation
# https://github.com/UCLATALL/czi-stats-course-files/blob/master/Fingers-Documentation.pdf

library(supernova)
data(package = "supernova")
data(Fingers)
head(Fingers)
head(Fingers, 3)
tail(Fingers)
str(Fingers)
Fingers$Sex <- factor(Fingers$Sex)
Fingers$Sex <- as.numeric(Fingers$Sex)
head(Fingers$Sex)
Interest.num <- as.numeric(Fingers$Interest)
head(Interest.num)
Interest.factor <-factor(Fingers$Interest)
Fingers$Sex <- factor(Fingers$Sex, levels = c(1,2), labels = c("female", "male"))


unique(Fingers$Job) # to find the levels of a factor
select(Fingers, RaceEthnic, Job)
head(select(Fingers, RaceEthnic, Job))

Fingers$RaceEthnic <- factor(Fingers$RaceEthnic, levels = 1:5, labels = c("White", "African American", "Asian", "Latino", "Other"))
head(Fingers$RaceEthnic )
Fingers$Job <- factor(Fingers$Job, levels = 1:3, labels = c("not working", "part-time job", "full-time job"))
head(Fingers$Job )
select(Fingers, RaceEthnic, Job)
head(select(Fingers, RaceEthnic), 3)
head(select(Fingers, Thumb), 10)







################################## Data  MindsetMatters
install.packages("Lock5withR")
library(Lock5withR)
data(MindsetMatters)
head(MindsetMatters)
names(MindsetMatters)
install.packages("dplyr")
library(dplyr)
tally(MindsetMatters$Age)
tally(~ Age, data = MindsetMatters)
arrange(MindsetMatters, Age)
print(MindsetMatters) # MindsetMatters did not change
MindsetMatters<-arrange(MindsetMatters, Age) # MindsetMatters did not change: sort by age
head(MindsetMatters)
MindsetMatters <-arrange(MindsetMatters, desc(Age))
head(MindsetMatters)
MindsetMatters <-arrange(MindsetMatters, desc(Wt))
head(MindsetMatters)
names(MindsetMatters)


##### MORE ON DATA MANIPULATION


##### select()
# select(df, A, B ,C): Select the variables A, B and C from df dataset.
# select(df, A:C): Select all variables from A to C from df dataset.
# select(df, -C): Exclude C from the dataset from df dataset.	
##### filter
filter(df, condition)



#Identifying Missing Data
# Filtering Data
#Creating Summary Variables
#Recoding Variables
#Creating Categorical Variables by Cutting Quantitative Variables
#Aggregating Data

#############Identifying Missing Data

Fingers <-arrange(Fingers, desc(SSLast))
head(Fingers)
Fingers.subset <-filter(Fingers, SSLast == "NA")

####### Creating Summary Variables
Fingers$RingLonger <- Fingers$Ring > Fingers$Index
tally(Fingers$RingLonger)
Fingers$IndexRingRatio <- Fingers$Index / Fingers$Ring
head(Fingers)
names(Fingers)

head(select(Fingers, Job, Job.recode))
# These also work:
# select(Fingers, Ring, Index, RingLonger) %>% head()
# Fingers %>% select(Ring, Index, RingLonger) %>% head()

Fingers$AvgFinger <- (Fingers$Thumb + Fingers$Index + Fingers$Middle + Fingers$Ring + Fingers$Pinkie)/5
head(Fingers)

# This also works:
# Fingers <- mutate(Fingers, AvgFinger = (Thumb + Index + Middle + Ring + Pinkie)/5)
# head(Fingers)



#####Recoding Variables

Fingers$Job.recode <- recode(Fingers$Job, "1" = 0, "2" = 50, "3" = 100)

head(select(Fingers, Job, Job.recode))



###### Creating Categorical Variables by Cutting Quantitative Variables
Fingers$Height2Group <- ntile(Fingers$Height, 2)
Fingers$Height2Group <- factor(Fingers$Height2Group, levels = 1:2, labels = c("short", "tall"))
head(select(Fingers, Height, Height2Group))


head(HappyPlanetIndex)
aggregate(Happiness ~ Region, data = HappyPlanetIndex, FUN = mean)


############################################################################
#        SAMPLING B                             	                         #
############################################################################

install.packages("fakeR")
library(fakeR)
data(package = "fakeR")
data(fakepop)


# IMPORTING DATA FROM URL

deloach1997 <-read.csv("https://raw.githubusercontent.com/UCLATALL/czi-stats-course-files/master/deLoach-1997-data-sim.csv", 
                       header=TRUE)

# Run str() on your data frame to see what the data frame contains.
str(deloach1997)
############################################################################
#        Chapter 4 - Explaining Variation                	                 #
############################################################################

gf_histogram(~Thumb, data=Fingers)
hist(Fingers$Thumb)

gf_histogram(~ Thumb, data = Fingers, fill = ~Sex)
gf_histogram(~ Thumb, data = Fingers, fill = ~Sex) %>%
  gf_refine(scale_fill_manual(values = c("purple", "orange")))


############################################################################
#        Chapter 5 - Explaining Variation                	                 #
############################################################################
