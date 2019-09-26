
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
library(mediation)
library(QuantPsyc)
library(interactions)
library(lavaan)
library(emmeans)
library(estimability)
library(optimx)
library(MuMIn)
library(sjstats)
library(lme4)
library(simr)
library(pbkrtest)
setwd ("D:/study/In Germany/data analysis for uploading or sharing/EDA raw data and proprocess script")

## read into data. 

soundpath = 'D:/study/In Germany/social buffering_outgroup/EMG/raw data/'

aa_sound_first <- read.table(paste(soundpath,'aloneaversivesounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
aa_sound_first$V6 <- 'first'
aa_sound_second <- read.table(paste(soundpath,'aloneaversivesounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
aa_sound_second$V6 <- 'second'
an_sound_first <- read.table(paste(soundpath,'aloneneutralsounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
an_sound_first$V6 <- 'first'
an_sound_second <- read.table(paste(soundpath,'aloneneutralsounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
an_sound_second$V6 <- 'second'

ia_sound_first <- read.table(paste(soundpath,'ingroupaversivesounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
ia_sound_first$V6 <- 'first'
ia_sound_second <- read.table(paste(soundpath,'ingroupaversivesounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
ia_sound_second$V6 <- 'second'
in_sound_first <- read.table(paste(soundpath,'ingroupneutralsounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
in_sound_first$V6 <- 'first'
in_sound_second <- read.table(paste(soundpath,'ingroupneutralsounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
in_sound_second$V6 <- 'second'

oa_sound_first <- read.table(paste(soundpath,'outgroupaversivesounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
oa_sound_first$V6 <- 'first'
oa_sound_second <- read.table(paste(soundpath,'outgroupaversivesounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
oa_sound_second$V6 <- 'second'
on_sound_first <- read.table(paste(soundpath,'outgroupneutralsounds_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
on_sound_first$V6 <- 'first'
on_sound_second <- read.table(paste(soundpath,'outgroupneutralsounds_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
on_sound_second$V6 <- 'second'  

total_sound <- rbind(an_sound_first, aa_sound_first, in_sound_first, ia_sound_first, an_sound_second, 
                     aa_sound_second, in_sound_second, ia_sound_second,on_sound_first,oa_sound_first,
                     on_sound_second,oa_sound_second)

names(total_sound)[1]<- "value"
names(total_sound)[2]<- "group"
names(total_sound)[3]<- "valence"
names(total_sound)[4]<- "segment"
names(total_sound)[5]<- "subject"
names(total_sound)[6]<- 'half'

total_sound$value <- log10(total_sound$value+1) 

total_sound$period <- 'presentation'

# read into cue data

cuepath = 'D:/study/In Germany/social buffering_outgroup/EMG/raw data/'

aa_cue_first <- read.table(paste(cuepath,'aloneaversivecues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
aa_cue_first$V6 <- 'first'
aa_cue_second <- read.table(paste(cuepath,'aloneaversivecues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
aa_cue_second$V6 <- 'second'
an_cue_first <- read.table(paste(cuepath,'aloneneutralcues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
an_cue_first$V6 <- 'first'
an_cue_second <- read.table(paste(cuepath,'aloneneutralcues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
an_cue_second$V6 <- 'second'

ia_cue_first <- read.table(paste(cuepath,'ingroupaversivecues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
ia_cue_first$V6 <- 'first'
ia_cue_second <- read.table(paste(cuepath,'ingroupaversivecues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
ia_cue_second$V6 <- 'second'
in_cue_first <- read.table(paste(cuepath,'ingroupneutralcues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
in_cue_first$V6 <- 'first'
in_cue_second <- read.table(paste(cuepath,'ingroupneutralcues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
in_cue_second$V6 <- 'second'
 
oa_cue_first <- read.table(paste(cuepath,'outgroupaversivecues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
oa_cue_first$V6 <- 'first'
oa_cue_second <- read.table(paste(cuepath,'outgroupaversivecues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
oa_cue_second$V6 <- 'second'
on_cue_first <- read.table(paste(cuepath,'outgroupneutralcues_trial_by_trial_firsthalf.txt',sep = ""),  sep = '')
on_cue_first$V6 <- 'first'
on_cue_second <- read.table(paste(cuepath,'outgroupneutralcues_trial_by_trial_secondhalf.txt',sep = ""),  sep = '')
on_cue_second$V6 <- 'second'  
  
total_cue <- rbind(aa_cue_first, aa_cue_second, an_cue_first, an_cue_second, ia_cue_first, 
                   ia_cue_second, in_cue_first, in_cue_second,oa_cue_first,oa_cue_second,
                   on_cue_first,on_cue_second)

names(total_cue)[1]<- "value"
names(total_cue)[2]<- "group"
names(total_cue)[3]<- "valence"
names(total_cue)[4]<- "segment"
names(total_cue)[5]<- "subject"
names(total_cue)[6]<- 'half'

total_cue$period <- 'anticipation'

total_cue$value <- log10(total_cue$value+1) 

total_data <- rbind(total_cue, total_sound)

# attach the questionnaires
questionnaire <- read.csv("D:/study/In Germany/SCR study/EADanalysis/raw data/questionnaires.csv",header = TRUE)
total_sound_questionnaires <- merge(total_sound,questionnaire,by=c('subject'))

# alone group: state anxiety ASI and trait anxiety to predict SCRs in alone group
aversivesound_alone <- total_sound_questionnaires[total_sound_questionnaires$valence=='aversive'& total_sound_questionnaires$group =='alone',]
lmer10 <- lmer (value ~ postanxiety+ASI.3+ traitanxiety +significant.other+friends +(1|subject),aversivesound_alone)
summary(lmer10)
summary(lmer10)$coef
std_beta(lmer10)
vif(lmer10)
r.squaredGLMM(lmer10)
Anova(lmer10, type=3)
simrOptions(lmerTestType=3)
powerSim(lmer10,nsim=50,test = simr::fixed("postanxiety",'anova'))
powerSim(lmer10,nsim=50,test = simr::fixed("ASI.3",'anova'))
powerSim(lmer10,nsim=50,test = simr::fixed("traitanxiety",'anova'))

###### estalish liner mixed model including period as a facor---two groups######

allmodel <- lmer (value ~ valence * period * group*half  + (valence|subject),
                   total_data[total_data$group!='outgroup',])
allmodelnull <- lmer(value ~ valence+valence|subject,total_data[total_data$group!='outgroup',])
anova(allmodel, allmodelnull)
summary(allmodel)$coef
std_beta(allmodel)
Anova(allmodel,type=3) # better when there is an interaction effect
r.squaredGLMM(allmodel)# compute the R2
r.squaredGLMM(allmodel, allmodelnull)
powerSim(allmodel,nsim=50,test = simr::fixed("valence",'anova'))
powerSim(allmodel,nsim=50,test = simr::fixed("period",'anova'))
powerSim(allmodel,nsim=50,test = simr::fixed("group",'anova'))
powerSim(allmodel,nsim=50,test = simr::fixed("valence:period",'anova'))
powerSim(allmode1,nsim=50,test = simr::fixed("valence:group",'anova'))
powerSim(allmodel,nsim=50,test = simr::fixed("period:group",'anova'))
powerSim(allmodel,nsim=50,test = simr::fixed("valence:period:group",'anova'))

emmeans(allmodel, pairwise ~ half|valence*period)


# For the anticipation period
cuemodel1 <- lmer (value ~ valence * group*half+ (valence|subject), 
                   total_cue[total_cue$group!='outgroup',])
cuemodel2 <- lmer(value ~ valence * group +(valence|subject), total_cue[total_cue$group!='outgroup',])
summary(cuemodel1)$coef
std_beta(cuemodel1)
anova(cuemodel1,cuemodel2)
Anova(cuemodel1,type=3)
r.squaredGLMM(cuemodel2)
powerSim(cuemodel1,nsim=50,test = simr::fixed("valence",'anova'))
powerSim(cuemodel1,nsim=50,test = simr::fixed("group",'anova'))
powerSim(cuemodel1,nsim=50,test = simr::fixed("valence:group",'anova'))

# for the presentation period -two groups, control = lmerControl(optimizer ='optimx', optCtrl=list(method='L-BFGS-B')
soundmodel1 <- lmer(value ~ valence * group + (valence|subject), 
               total_sound[total_sound$group!='outgroup',],)
summary(soundmodel1)$coef
std_beta(soundmodel1)
powerSim(soundmodel1,nsim=50,test = simr::fixed("valence",'anova'))
powerSim(soundmodel1,nsim=50,test = simr::fixed("group",'anova'))
powerSim(soundmodel1,nsim=50,test = simr::fixed("valence:group",'anova'))
Anova(soundmodel1,type=3)
r.squaredGLMM(soundmodel1)
emm_options(lmerTest.limit = 5207)
emm_options(pbkrtest.limit = 5207)
emmeans(soundmodel1, pairwise ~ group|valence)
emmeans(soundmodel1,pairwise ~ half)

 # for the presentation period -three groups,
lmer22 <- lmer(value ~ valence * group + (valence|subject), total_sound)
summary(lmer22)$coef
Anova(lmer22,type=3)
std_beta(lmer22)
powerSim(lmer22,nsim=50,test = simr::fixed("valence",'anova'))# the observed power of valence?
powerSim(lmer22,nsim=50,test = simr::fixed("groupingroup",'z'))# the observed power of ingroup
powerSim(lmer22,nsim=50,test = simr::fixed("groupoutgroup",'z'))# the observed power of outgroup
powerSim(lmer22,nsim=50,test = simr::fixed("valenceaversive:groupingroup",'z'))# the observed power of valence2:ingroup
powerSim(lmer22,nsim=50,test = simr::fixed("valenceaversive:groupoutgroup",'z'))# the observed power of valence2:outgroup
powerSim(lmer22,nsim=50,test = fcompare(rating2~valence+group)) # the observed power of interaction

r.squaredGLMM(lmer22)
emm_options(lmerTest.limit = 5207)
emm_options(pbkrtest.limit = 5207)
emmeans(lmer22, pairwise ~ group|valence)
# three group, aversive sound
lmer23 <- lmer(value ~ group + (1|subject),  total_sound[total_sound$valence=='aversive',])
summary(lmer23)
Anova(lmer23,type=3)
r.squaredGLMM(lmer23)
emmeans(lmer23,pairwise ~group)
# three group, neutral sound
lmer24 <- lmer(value ~ group + (1|subject), total_sound[total_sound$valence=='neutral',])
summary(lmer24)
Anova(lmer24,type=3)


### Relationship between the social modulation of fear and individual differences in anxiety
aversivesound_twogroups <- subset(total_sound_questionnaires, group != 'outgroup'&valence=='aversive')
#normalized the date
aversivesound_twogroups$scalepostanxiety <- scale( aversivesound_twogroups$postanxiety)
aversivesound_twogroups$scaletraitanxiety <- scale( aversivesound_twogroups$traitanxiety)
aversivesound_twogroups$scaleASI <- scale( aversivesound_twogroups$ASI.3)
aversivesound_twogroups$scalevalue <- scale( aversivesound_twogroups$value)

lmer11 <- lmer (scalevalue ~ scaleASI*group+ scalepostanxiety*group + 
                  scaletraitanxiety*group+scale(significant.other)+scale(friends)+(1|subject), 
                aversivesound_twogroups)
summary(lmer11)
std_beta(lmer11)
vif(lmer11)
r.squaredGLMM(lmer11)
Anova(lmer11,type=3)
anova(lmer11)
emtrends(lmer11, pairwise ~ 'group', var = "scalepostanxiety") # simple slope analysis
powerSim(lmer11,nsim=50,test = simr::fixed("scalepostanxiety",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("scaleASI",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("scaletraitanxiety",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("group",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("scalepostanxiety:group",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("scaleASI:group",'anova'))
powerSim(lmer11,nsim=50,test = simr::fixed("scaletraitanxiety:group",'anova'))


#####  mediation model for ingroup data ######

aversive_sound_ingroup <- subset(total_sound_questionnaires,valence == 'aversive'& group == 'ingroup')

nrow(aversive_sound_ingroup)

myvars <- c('subject','value','group','valence','segment','half','totalcommoninverse','anxietylevel',
            'postanxiety','significant.other','friends','family','helpful')

aversivesound_ingroup_relevant<-aversive_sound_ingroup[myvars]

aversivesound_ingroup_relevant <- na.omit(aversivesound_ingroup_relevant) # use na.omit()function to omit the NA value to avoid the different observations of variables

nrow(aversivesound_ingroup_relevant)
# normalized the variables
aversivesound_ingroup_relevant$postanxiety <- scale(aversivesound_ingroup_relevant$postanxiety)
aversivesound_ingroup_relevant$friends <- scale(aversivesound_ingroup_relevant$friends)
aversivesound_ingroup_relevant$totalcommoninverse <- scale(aversivesound_ingroup_relevant$totalcommoninverse) 
aversivesound_ingroup_relevant$significant.other <- scale(aversivesound_ingroup_relevant$significant.other)
aversivesound_ingroup_relevant$helpful <- scale(aversivesound_ingroup_relevant$helpful)

## using mediation package, when using lmer(), can only us lme4(), not lmerTest()
med.fit <- lm( totalcommoninverse ~ postanxiety+significant.other+friends, 
                 data=aversivesound_ingroup_relevant) # use 'data=' to use same dataset
summary(med.fit)
Anova(med.fit)
lm.beta(med.fit)

out.fit <-lm(value~postanxiety+totalcommoninverse+friends+significant.other,
          data=aversivesound_ingroup_relevant)
summary(out.fit)
Anova(out.fit)
lm.beta(out.fit)

med.out <- mediation::mediate(med.fit, out.fit, treat = "postanxiety", mediator = "totalcommoninverse", 
                   boot = FALSE,sims = 5000, data=aversivesound_ingroup_relevant)
summary(med.out)


# package 'lavaan': predictor: postanxiety, mediator: totalcommoninverse

model14 <- '
value ~ c*postanxiety  +  b*totalcommoninverse+ significant.other + friends+family+helpful
totalcommoninverse~ a*postanxiety + significant.other + friends+family+helpful

# indirect effect
indirecteffct :=  a * b
'

fit1 <- sem(model14, data = aversivesound_ingroup_relevant)# when analysis mutle-level data, add 'cluster = subject'
inspect(fit1)
summary(fit1, fit.measures = TRUE) 

#predictor: totalcommoninverse, mediator: postanxiety

model15 <- '
value ~ c*totalcommoninverse  +  b*postanxiety+ significant.other + friends
postanxiety ~ a*totalcommoninverse + significant.other + friends

# indirect effect
indirecteffct :=  a * b
'

fit2 <- sem(model15, data = aversivesound_ingroup_relevant)
inspect(fit2)
summary(fit2, fit.measures = TRUE) 

anova(fit1, fit2)

############# moderated mediation model ##############

aversive_sound_social <- subset(total_sound_questionnaires,valence == 'aversive'& group != 'alone')
nrow(aversive_sound_social)
myvars <- c('subject','value','group','valence','segment','half','totalcommoninverse','anxietylevel',
            'postanxiety','significant.other','friends','family','helpful')
aversivesound_social_relevant<-aversive_sound_social[myvars]
aversivesound_social_relevant <- na.omit(aversivesound_social_relevant) # use na.omit()function to omit the NA value to avoid the different observations of variables
nrow(aversivesound_social_relevant)

#normaliz the continous variable
aversivesound_social_relevant$postanxiety <- scale(aversivesound_social_relevant$postanxiety)
aversivesound_social_relevant$friends <- scale(aversivesound_social_relevant$friends)
aversivesound_social_relevant$totalcommoninverse <- scale(aversivesound_social_relevant$totalcommoninverse) 
aversivesound_social_relevant$significant.other <- scale(aversivesound_social_relevant$significant.other)
aversivesound_social_relevant$family <- scale(aversivesound_social_relevant$family)
aversivesound_social_relevant[aversivesound_social_relevant$group=='ingroup','dummygroup']<- 0
aversivesound_social_relevant[aversivesound_social_relevant$group=='outgroup','dummygroup']<-1
aversivesound_social_relevant$anxietygroup <- aversivesound_social_relevant$postanxiety * aversivesound_social_relevant$dummygroup
aversivesound_social_relevant$similaritygroup <- aversivesound_social_relevant$totalcommoninverse * aversivesound_social_relevant$dummygroup

# firstly, estalish a lmer mixed model to test an interaction among anxiety,similarity
# three way: group*similarity*anxiety
lmer30 <- lmer(value ~ postanxiety * group + (1|subject), aversivesound_social_relevant)
summary(lmer30)
Anova(lmer30)
emtrends(lmer30, pairwise ~ 'group', var = "postanxiety")

lmer31<- lmer(value ~ totalcommoninverse * group+ (1|subject), aversivesound_social_relevant)
summary(lmer31)
Anova(lmer31) 
anova(lmer31) # compute the significance of fixed factors
r2(lmer31) # compute the R2
r.squaredGLMM(lmer31) # calculate the revised statistic 
ranova(lmer31) # compute the signifcance of random factors

# using 'mediation package'  using lmer() can only be done in lme4, but not lmeTest##### 
model20 <- lm(value ~ scale(postanxiety) +scale(significant.other)+scale(friends), aversivesound_social_relevant) 
summary(model20)
Anova(model20)
lm.beta(model20)

model21 <- lm(scale(totalcommoninverse) ~ scale(postanxiety) +scale(significant.other)+scale(friends), aversivesound_social_relevant) 
summary(model21)
Anova(model21)
lm.beta(model21)

model22 <- lm(value ~ totalcommoninverse + postanxiety +significant.other+friends,aversivesound_social_relevant )
summary(model22)
Anova(model22)
lm.beta(model22)

med.ingroup <- mediate(model21, model22, treat='postanxiety',mediator = 'totalcommoninverse',
                       covariates = list(aversivesound_social_relevant$group == 'ingroup'), boot = FALSE, sims = 2000)
summary(med.ingroup)
plot(med.ingroup)

med.outgroup <- mediate(model21,model22,treat='postanxiety',mediator = 'totalcommoninverse',
                        covariates = list(aversivesound_social_relevant$group == 'outgroup'),boot = FALSE,sims = 2000)
summary(med.outgroup)
plot(med.outgroup)

# test the difference

med.init <- mediate(model21,model22, treat = 'postanxiety',mediator = 'totalcommoninverse',boot = FALSE,sims = 2000)

test.modmed(med.init, covariates.1 = list (aversivesound_social_relevant$group == 'ingroup'),
            covariates.2 = list (aversivesound_social_relevant$group == 'outgroup'),sims=2000)

############### using package 'lavaan' ################

# 1. lavaan: full model, on path a and path b, and direct path +c*anxietygroup
model20 <- '
value ~ a*postanxiety + b*dummygroup +  d*totalcommoninverse + 
f*similaritygroup+friends+significant.other+family+helpful
totalcommoninverse ~ g*postanxiety + h*dummygroup + i*anxietygroup+friends+
significant.other+family+helpful
# indirect effect 
ingroup := (g*d)
outgroup := (g+i) * (d+f)
'
fit1 <- sem(model20, data = aversivesound_social_relevant)#if want to as subject as a cluster, add 'cluster = 'subject''
inspect(fit1)
summary(fit1, fit.measures = TRUE) 


# 2. lavaan: test the moderation effect on path a: x--->mediator
# test whether a1 and  a3, (and b) is singificant or not, if it is significant, then the mediation effect is moderated.
model21 <- '
value ~ c*postanxiety+b*totalcommoninverse+friends+significant.other+helpful
totalcommoninverse ~ a1*postanxiety+a2*dummygroup+a3*anxietygroup+friends+significant.other+helpful
# indirect effect (a*d) when group = 0(ingroup)
ingroup :=  a1 * b
# indirect effect (a*d) when group = 1(outgroup)
outgroup := (a1 + a3) * b
# Index of moderated mediation
index.mod.med := a3*b
'
fit2 <- sem(model21, data = aversivesound_social_relevant)
inspect(fit2)
summary(fit2, fit.measures = TRUE) 

#3. lavaan: test the moderation effect on path b
model31 <- '
value ~ c*postanxiety  +  b1*totalcommoninverse + b2*similaritygroup +b3*dummygroup+
friends+significant.other
totalcommoninverse ~ a*postanxiety+significant.other
# indirect effect (a*b1) when group = 0(ingroup)
ingroup :=  a * b1
# indirect effect a*(b1+b2) when group = 1(outgroup)
outgroup := a * (b1+b2)
'
fit3 <- sem(model31, data = aversivesound_social_relevant,cluster = 'subject')
inspect(fit3)
summary(fit3, fit.measures = TRUE) 


#### mediation model only in the outgroup
aversive_sound_outgroup <- subset(total_sound_questionnaires,valence == 'aversive'& group == 'outgroup')
nrow(aversive_sound_outgroup)
myvars <- c('subject','value','group','valence','segment','half','totalcommoninverse','anxietylevel',
            'postanxiety','significant.other','friends','family','helpful','easier')
aversivesound_outgroup_relevant<-aversive_sound_outgroup[myvars]
aversivesound_outgroup_relevant <- na.omit(aversivesound_outgroup_relevant) # use na.omit()function to omit the NA value to avoid the different observations of variables
nrow(aversivesound_outgroup_relevant)

aversivesound_outgroup_relevant$postanxiety <- scale(aversivesound_outgroup_relevant$postanxiety)
aversivesound_outgroup_relevant$friends <- scale(aversivesound_outgroup_relevant$friends)
aversivesound_outgroup_relevant$totalcommoninverse <- scale(aversivesound_outgroup_relevant$totalcommoninverse) 
aversivesound_outgroup_relevant$significant.other <- scale(aversivesound_outgroup_relevant$significant.other)
aversivesound_outgroup_relevant$family <- scale(aversivesound_outgroup_relevant$family)
aversivesound_outgroup_relevant$helpful <- scale(aversivesound_outgroup_relevant$helpful)

lm0 <- lmer(value ~ postanxiety+friends+significant.other+family+helpful+(1|subject),
            aversivesound_outgroup_relevant)
summary(lm0)

model15 <- '
value ~ c*postanxiety  +  b*totalcommoninverse+ significant.other + friends +helpful+family
totalcommoninverse~ a*postanxiety + significant.other + friends  +helpful+family

# indirect effect
indirecteffct :=  a * b
'
fit4 <- sem(model15, data = aversivesound_outgroup_relevant)# when analysis mutle-level data, add 'cluster = subject'
inspect(fit4)
summary(fit4, fit.measures = TRUE) 

#### mediation model only in the ingroup
aversive_sound_ingroup <- subset(total_sound_questionnaires,valence == 'aversive'& group == 'ingroup')
nrow(aversive_sound_ingroup)
myvars <- c('subject','value','group','valence','segment','half','totalcommoninverse','anxietylevel',
            'postanxiety','significant.other','friends','family','helpful','easier')
aversivesound_ingroup_relevant<-aversive_sound_ingroup[myvars]
aversivesound_ingroup_relevant <- na.omit(aversivesound_ingroup_relevant) # use na.omit()function to omit the NA value to avoid the different observations of variables
nrow(aversivesound_ingroup_relevant)

aversivesound_ingroup_relevant$postanxiety <- scale(aversivesound_ingroup_relevant$postanxiety)
aversivesound_ingroup_relevant$friends <- scale(aversivesound_ingroup_relevant$friends)
aversivesound_ingroup_relevant$totalcommoninverse <- scale(aversivesound_ingroup_relevant$totalcommoninverse) 
aversivesound_ingroup_relevant$significant.other <- scale(aversivesound_ingroup_relevant$significant.other)
aversivesound_ingroup_relevant$family <- scale(aversivesound_ingroup_relevant$family)
aversivesound_ingroup_relevant$helpful <- scale(aversivesound_ingroup_relevant$helpful)

model16 <- '
value ~ c*postanxiety  +  b*totalcommoninverse+ significant.other + friends +family+helpful
totalcommoninverse~ a*postanxiety + significant.other + friends +family +helpful

# indirect effect
indirecteffct :=  a * b
'

fit5 <- sem(model16, data = aversivesound_ingroup_relevant)# when analysis mutle-level data, add 'cluster = subject'
inspect(fit5)
summary(fit5, fit.measures = TRUE) 


# plot
aversivesound_twogroups <- subset(total_sound_questionnaires, group != 'outgroup'&valence=='aversive')

p.postanxiety <- ggplot(data = aversivesound_twogroups,mapping = aes(x = postanxiety, 
                y = value,color=group))+  scale_color_manual(values = c('black','darkgrey'))+
                stat_smooth(method = lm) +theme(legend.position = "bottom",
              legend.text = element_text(size=16), legend.title = element_blank(),
  axis.text=element_text(size=16,color = 'black'), axis.title=element_text(size=18),
  panel.grid.major =element_blank(), panel.grid.minor = element_blank(),
  panel.background = element_blank(),axis.line = element_line(colour = "black"))+
  ylab("SCRs")
  

p.postanxiety




