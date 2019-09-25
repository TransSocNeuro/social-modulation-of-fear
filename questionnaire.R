rm(list = ls())
library(psych)
setwd ("D:/study/In Germany/social buffering_outgroup/EMG")
mydata <- read.csv('threegroups.csv', header = TRUE,sep = ",")
# test whether there is difference between ingroup and outgroup on impression ratings
t.test(impressionsum1_7 ~ group, var.equal = TRUE, data = mydata)
boxplot(impressionsum1_7 ~ group, data = mydata, xlab = "group", ylab="impression ratings" )
describe(mydata[mydata$group=='ingroup',]$impressionsum1_7)
describe(mydata[mydata$group=='outgroup',]$impressionsum1_7)

t.test(impression1_3 ~ group, var.equal = TRUE, data = mydata)
boxplot(impression1_3 ~ group, data = mydata, xlab = "group", ylab="impression ratings" )

t.test(totalcommoninverse ~ group,data = mydata)
describe(mydata[mydata$group=='ingroup',]$totalcommoninverse)
describe(mydata[mydata$group=='outgroup',]$totalcommoninverse)

describe(mydata[mydata$group=='outgroup',]$helpful)


t.test(bearable ~ group,data = mydata[mydata$group !='alone',])
aov0 <- aov(bearable ~ group, data = mydata)
summary(aov0)
emmeans(aov0,pairwise ~ group)

# test whether there is difference among three groups on positivechange, negativechange and anxietychange
anova1 <- aov(positivechange ~ group, data = mydata)
summary(anova1)
TukeyHSD(anova1)

anova2 <- aov(negativechange ~ group, data = mydata)
summary(anova2)
TukeyHSD(anova2)

anova3 <- aov(anxietychange ~ group, data = mydata)
summary(anova3)
TukeyHSD(anova3)

# correlation analysis
#correlation between similarity and stress ratings
cor.test(mydata$bearable,mydata$totalcommoninverse,method = 'pearson')
cor.test(mydata[mydata$group == 'ingroup',]$totalcommoninverse, mydata[mydata$group == 'ingroup',]$bearable,method='pearson')
cor.test(mydata[mydata$group == 'outgroup',]$totalcommoninverse, mydata[mydata$group == 'outgroup',]$bearable,method='pearson')


cor.test(mydata$ASI.3,mydata$postanxiety,method='pearson')
cor.test(mydata[mydata$group == 'ingroup',]$postanxiety, mydata[mydata$group == 'ingroup',]$totalcommoninverse,method='pearson')
cor.test(mydata[mydata$group == 'ingroup',]$traitanxiety, mydata[mydata$group == 'ingroup',]$totalcommoninverse,method='pearson')
cor.test(mydata[mydata$group == 'ingroup',]$ASI.3, mydata[mydata$group == 'ingroup',]$totalcommoninverse,method='pearson')
cor.test(mydata[mydata$group == 'outgroup',]$postanxiety, mydata[mydata$group == 'outgroup',]$totalcommoninverse,method='pearson')

cor.test(mydata$ASI.3, mydata$totalcommoninverse,method='pearson')
cor.test(mydata$traitanxiety, mydata$totalcommoninverse,method='pearson')
cor.test(mydata$postanxiety, mydata$totalcommoninverse,method='pearson')


lm1 <- lm(scale(totalcommoninverse) ~ scale(postanxiety)+ scale(friends) +
            scale(significant.other)+scale(family) , mydata[mydata$group == 'ingroup',])
summary(lm1)

lm2 <- lm(firstaversivesound ~ traitanxiety * group, mydata[mydata$group != 'outgroup',] )
summary(lm2)

lm3 <- lm(scale(totalcommoninverse)~scale(postanxiety)*group+friends+significant.other,
          mydata[mydata$group != 'alone',])
summary(lm3)
Anova(lm3, type=3)

## compare demographic information among three groups
aov4 <- aov(age ~ group, data = mydata)
summary(aov4)
aggregate(bearable ~ group, data = mydata, FUN = "mean") 

aov5 <- aov(family ~ group, data = mydata)
summary(aov5,digit=5)
 
