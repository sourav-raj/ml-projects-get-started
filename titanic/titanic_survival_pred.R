setwd("~/R/code-base/analyticvidya/titanic/")
train = read.csv("train.csv")
# to see structure of train df 
str(train)
# to view train df
View(train)
test = read.csv('test.csv')

train$Survived # will give a vector

table(train$Survived) # will provide count of individual category

prop.table(table(train$Survived)) # will provide count in % 

# rep will create a vector with same content 
test$Survived = rep(0,418)

submit = data.frame(PassengerID = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = 'theyalldie.csv', row.names = FALSE)

# since people saved womens & children first lets consider gender & age first

table(train$Sex)

prop.table(table(train$Sex))

# propationate table
prop.table(table(train$Sex, train$Survived)) # give percentage on entire data

# we want on basis of row or for each Sex individually. 1 means row wise, 
# 2 means col wise

prop.table(table(train$Sex, train$Survived), 1)

# since 75% of female got save
test$Survived =0
test$Survived[test$Sex=='female']=1

# let's see age column
train$Age
summary(train$Age)

# create a child column
train$child = 0
train$child[train$Age <18]=1

# will see the survival propotionate with sex and age together. prop.table will not
# work we have to use aggregate

aggregate(Survived ~ child + Sex, data = train, FUN = sum)

# above will give how much survived in each category . to know how many was there
# we use aggregate again

aggregate(Survived ~ child + Sex, data = train, FUN=length)

# to find out in proportionate

aggregate(Survived ~ child + Sex, data = train , FUN = function(x) {sum(x)/length(x)})

# male doesn't survive even he is child so don't change on outpur. let's check other
#variables

train$Fare

train$Fare2 = '30+'
train$Fare2[train$Fare < 30 & train$Fare >=20 ] = '20-30'
train$Fare2[train$Fare < 20 & train$Fare >=10]= '10-20'
train$Fare2[train$Fare < 10] = '<10'

aggregate(Survived ~ Fare2 + Pclass + Sex, data = train, FUN = function(x){sum(x)/length(x)})

# male candidate still don't follow any particular trend
# female with pclass = 3 and Fare2 >20 have lost their life

test$Survived =0
test$Survived[test$Sex=='female']=1
test$Survived[test$Sex =='female' & test$Pclass ==3 & test$Fare >=20]=0

submit = data.frame(PassengerID = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = 'theyalldie.csv', row.names = FALSE)

# let's use decision tree 

# Recursive partitioning and regression tree (rpart)
library(rpart)
 # method = 'class' if binary output
# method = 'anova' if continuous output
fit = rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
            data = train, method = 'class')

# to examine the created tree let's plot it
plot(fit)
text(fit)

# to see some more informatic graphics

library(rattle)
