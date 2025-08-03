wine_quality<- read.csv("winequality-red.csv")
head(wine_quality)
table(wine_quality$fixed.acidity)
barplot(table(wine_quality$fixed.acidity)) #x axis it will plot the amount of fixed acidity AND Y AXIS IT WILL PLOT how many samples has this kind of fixed acidity)
barplot(table(wine_quality$quality))
wine_quality$taste <- ifelse(wine_quality$quality<5,"bad","good")
wine_quality$taste[wine_quality$quality=="5"]<-"normal"
wine_quality$taste[wine_quality$quality=="6"]<-"normal"
wine_quality$taste<- as.factor(wine_quality$taste) # to store categorical values in a vector to use for furthur statistical evaluations
table(wine_quality$taste)
#separating training and tasting data
set.seed(23) #same rows are sampled every time the code is run
samp<- sample(nrow(wine_quality),0.8*nrow(wine_quality)) #Randomly samples 80% of the row indices
train<- wine_quality[samp, ] #Stores the resulting 80% of data in the train dataset
test<- wine_quality[-samp, ] #remaining 20% of the data
#ML Algorithm
install.packages("randomForest")
library(randomForest)
Mlmodel<- randomForest(taste~.-quality, data=train)
Mlmodel
Mlpred<-predict(Mlmodel, newdata = test)
table(Mlpred, test$taste)
install.packages("caret")
library(caret)
confusionMatrix(Mlpred, test$taste)
save.image(file="wine_quality_classification.RData")
hi

