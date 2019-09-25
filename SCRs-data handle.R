###for social buffering analysis
# for data handing

# subject in alone condition£º1,4,5,7,8,9,10,12,13,14,15,16,17,18,26,32,33,42,56,63,64,65,67,68,69,71,72,73,74,78,81
# subject in social condition£º19,20,22,24,25,27,28,29,30,31,34,36,39,41,43,45,46,47,48,50,51,52,54,55,57,58,59,60,61,62,66,75,76,79,80

rm(list = ls())

library(Matrix)
library(plyr)
library(car)
library(stringr)
library(foreign)
library(ggplot2)
library(ggpmisc)
library(psych)
library(lme4)
library(tidyr)
library(gridExtra)
library(mediation)
library(interactions)
library(lavaan)
library(emmeans)
library(estimability)


setwd ("D:/study/In Germany/SCR study/EADanalysis/raw data")

# for alone condition,neutral sound

subject_alone = c(1,4,5,7,8,9,10,12,13,14,15,16,17,18,26,32,33,42,56,63,64,65,67,68,69,71,72,73,74,78,81)  
for (i in subject_alone)  {
  x<-paste(i,"_neutralsound_secondhalf.csv",sep = "")  # the file name
  b <- read.delim(x,sep = "",header = FALSE)   # read into the file
  b$gruop <- "alone"       # add the new variable "group"    "0--the alone group"
  b$valence <- "neutral"      # add the new variable "valence"     "0--the neutral"
  b$segment <- c(14:(nrow(b)+13))
  b$subject <- i
  b$half <- "second"
  write.table(b,"aloneneutralsounds_trial_by_trial_second.txt",append =TRUE,sep = "\t", row.names = FALSE,col.names = FALSE) # write the new file to new txt file, no append, no row names and column names
}


# for alone condition, aversive sound

subject_alone = c(1,4,5,7,8,9,10,12,13,14,15,16,17,18,26,32,33,42,56,63,64,65,67,68,69,71,72,73,74,78,81)  #subject in alone condition
for (i in subject_alone)  {
  x<-paste(i,"_aversivesound_secondhalf.csv",sep = "")  # the file name
  b <- read.delim(x,sep = "",header = FALSE)   # read into the file
  b$gruop <- "alone"       # add the new variable "group"    "0--the alone group"
  b$valence <- "aversive"      # add the new variable "valence"     "1--the aversive"
  b$segment <- c(14:(nrow(b)+13))
  b$subject <- i
  b$half <- "second"  
  write.table(b,"aloneaversivesounds_trial_by_trial_second.txt",append =TRUE,sep = "\t", row.names = FALSE,col.names = FALSE) # write the file to new txt file, "no append, no row names and column names
}


# for social condition, neutral sound

subject_social = c(19,20,22,24,25,27,28,29,30,31,34,36,39,41,43,45,46,47,48,50,51,52,54,55,57,58,59,60,61,62,66,
                   75,76,79,80)  #subject in social condition 19,20,22,24,25,27,28,29,30,31,34,36,39,41,43,45,46,47,48,50,51,52,54,55,57,58,59,60,61,62
for (i in subject_social)  {
  x<-paste(i,"_neutralsound_secondhalf.csv",sep = "")  # the file name
  b <- read.delim(x,sep = "",header = FALSE)   # read into the file
  b$gruop <- "ingroup"       # add the new variable "group"    "1--the social group"
  b$valence <- "neutral"      # add the new variable "valence"     "0--the neutral"
  b$segment <- c(14:(nrow(b)+13))
  b$subject <- i
  b$half <- "second"  
  write.table(b,"socialneutralsounds_trial_by_trial_second.txt",append =TRUE,sep = "\t", row.names = FALSE,col.names = FALSE) # write the new file to new txt file, no append, no row names and column names
}


# for social condition, aversive sound

subject_social = c(19,20,22,24,25,27,28,29,30,31,34,36,39,41,43,45,46,47,48,50,51,52,54,55,57,58,59,60,61,62,
                   66,75,76,79,80)  #subject in social condition
for (i in subject_social)  {
  x<-paste(i,"_aversivesound_secondhalf.csv",sep = "")  # the file name
  b <- read.delim(x,sep = "",header = FALSE)   # read into the file
  b$gruop <- "ingroup"       # add the new variable "group"    "1--the social group"
  b$valence <- "aversive"      # add the new variable "valence"     "1--the aversive"
  b$segment <- c(14:(nrow(b)+13))
  b$subject <- i
  b$half <- "second" 
  write.table(b,"socialaversivesounds_trial_by_trial_second.txt",append =TRUE,sep = "\t", row.names = FALSE,col.names = FALSE) # write the new file to new txt file, no append, no row names and column names
}


