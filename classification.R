names(Smarket)
summary(Smarket)

glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Volume, data=Smarket, family=binomial)
## binomial means logistic regression

## get results
summary(glm.fit)

## make predictions
## glm.fit is the model
## try first five observations and return a probability
glm.probs <- predict(glm.fit, type="response")
glm.probs[1:5]

## turn probabilities into classifications using ifelse command
glm.pred <- ifelse(glm.probs>0.5, "Up", "Down")
attach(Smarket)

## in the source table, Direction is "up" and "down"
## now we make a table showing the predictions compared to the original observations
table(glm.pred, Direction)

## mean classification performance (where we got it right)
mean(glm.pred==Direction)

## create training set and fit on training set
train <- Year<2005
glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Volume, data=Smarket, family=binomial, subset=train)

##get probabilties the same way but this time, data is everything except train
gls.probs <- predict(glm.fit, data=Smarket[!train], type="response")

glm.pred <- ifelse(glm.probs>0.5, "Up", "Down")
Direction.2005 <- Smarket$Direction[!train]
table(glm.pred, Direction.2005)
mean(glm.pred==Direction.2005)

## try a model with fewer predictors
glm.fit <- glm(Direction~Lag1+Lag2, data=Smarket, family=binomial, subset=train)
gls.probs <- predict(glm.fit, data=Smarket[!train], type="response")

glm.pred <- ifelse(glm.probs>0.5, "Up", "Down")
Direction.2005 <- Smarket$Direction[!train]
table(glm.pred, Direction.2005)
summary(glm.fit)

## linear discriminant analysis
require(ISLR)
require(MASS)

lda.fit <- lda(Direction~Lag1+Lag2, data=Smarket, subset = Year<2005)
lda.fit
plot(lda.fit) ## plots lda function

## how well can we predict year 2005
Smarket.2005 = subset(Smarket, Year==2005)
lda.pred <- predict(lda.fit, Smarket.2005)
## print first 5 predictions
## what format is it in?
class(lda.pred) ## it is a list

data.frame(lda.pred)[1:5,]

table(lda.pred$class, Smarket.2005$Direction)
mean(lda.pred$class==Smarket.2005$Direction)

## K NEAREST NEIGHBOR CLASSIFICATION
## simple but effective 1/3 of the time
## always should try it

library(class)

attach(Smarket)
xlag <- cbind(Lag1, Lag2)
train <- Year<2005

knn.pred <- knn(xlag[train], xlag[!train], Direction[train], k=1)
table(knn.pred, Direction[!train])
mean(knn.pred==Direction![train])





