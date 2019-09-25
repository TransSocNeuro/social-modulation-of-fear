
rm(list = ls())

library(Matrix)
library(plyr)
library(car)
library(stringr)
library(foreign)
library(ggplot2)
library(ggpmisc)
library(psych)
library(lmerTest)
library(tidyr)
library(gridExtra)
library(Hmisc)
library(emmeans)
library(estimability)
library(MuMIn)
library(pbkrtest)

setwd ("D:/study/In Germany/SCR study/behavior")

# read into the ratings data

alone <- read.delim('ratings_trial_by_trial_alone.txt',sep = "",header = FALSE)   # read into the file
ingroup <- read.delim('ratings_trial_by_trial_ingroup.txt',sep = "",header = FALSE)
outgroup <- read.delim('ratings_trial_by_trial_outgroup.txt',sep = "",header = FALSE)

mydata <- rbind(alone, ingroup, outgroup)

names(mydata)<-c("subject","rating1","rating2","valence","segment","group")

mydata[mydata$segment <= 13,'half']<-'first'
mydata[mydata$segment > 13,'half']<-'second'

mydata$valence <- as.factor(mydata$valence)

# estalish the model for alone condition and ingroup condition
lmer1 <- lmerTest::lmer(rating2 ~ valence *group + (valence|subject), mydata[mydata$group != 'outgroup',])
summary(lmer1)$coef
std_beta(lmer1)
anova(lmer1)
Anova(lmer1, type=3)
r.squaredGLMM(lmer1)
emmeans(lmer1, pairwise ~ valence)# post-hoc test
powerSim(lmer1,nsim=50,test = simr::fixed("valence",'anova'))# the observed power of valence?
powerSim(lmer1,nsim=50,test = simr::fixed("group",'anova'))# the observed power of group?
powerSim(lmer1,nsim=50,test = simr::fixed("valence:group",'anova'))
powerSim(lmer1,nsim=50,test = fcompare(rating2~valence+group)) # the observed power of interaction
lastResult()$errors

#  estalish the model for three groups

lmer2 <- lmer (rating2 ~ valence*group + (valence|subject), mydata)
summary(lmer2)$coef
Anova(lmer2, type=3)
std_beta(lmer2)
r.squaredGLMM(lmer2)
emmeans(lmer2, pairwise ~ valence)
powerSim(lmer2,nsim=50,test = simr::fixed("valence",'anova'))# the observed power of valence?
powerSim(lmer2,nsim=50,test = simr::fixed("groupingroup",'z'))# the observed power of ingroup
powerSim(lmer2,nsim=50,test = simr::fixed("groupoutgroup",'z'))# the observed power of outgroup
powerSim(lmer2,nsim=50,test = simr::fixed("valence2:groupingroup",'z'))# the observed power of valence2:ingroup
powerSim(lmer2,nsim=50,test = simr::fixed("valence2:groupoutgroup",'z'))# the observed power of valence2:outgroup
powerSim(lmer2,nsim=50,test = fcompare(rating2~valence+group)) # the observed power of interaction
lastResult()$errors

powerSim(lmer2, fixed("groupingroup", "z"), nsim=20)
