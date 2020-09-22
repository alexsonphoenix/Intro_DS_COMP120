#install and load packages
install.packages("randomForest")
library(tidyverse)
library(randomForest)



set.seed(123) ## FIX THE RANDOM NUMBER GENERATOR FOR REPRODUCIBILITY

# Prepare datas
housing <- read_csv("housing.csv")

train <- housing %>% sample_frac(0.8)
test <- housing %>% setdiff(train)

f <- medv ~ chas + dis + lstat + nox + ptratio + rm

# Compute R square statustic for the data
rsqr <- function(y, yhat) {
  ss.res <- sum((y - yhat)^2)
  ss.tot <- sum((y - mean(y))^2)
  
  1 - ss.res / ss.tot
}

#-----------------------------------------------------------LINEAR REGRESSION-------------------------------------------------------
model <- lm(f, data = train)

summary(model)

# Use predict function to predict the results for the test data
yhat <- predict(model, test)

# Create a new variable called test_mod that is made up of variables # in test plus the residual variable
test_mod <- test %>% mutate(residual = medv - yhat)

# Visualise the residual plot
ggplot(test_mod, aes(x=medv, y=residual)) +
  geom_point() + 
  xlim(0, 60) + 
  ylim(-30,30) +
  geom_abline(slope = 0, intercept=0, col = "blue") + 
  ggtitle("Median house value vs. residual") +
  xlab("Median value") + 
  ylab("Residual")



rsqr(test$medv, yhat)




#-----------------------------------------------------------RANDOM FOREST-------------------------------------------------------
# Create a model using randomForest function (using training data)
mdl <- randomForest(f, train)

# Predict the results of the test data
yhat <- predict(mdl, test)

# Display r-squared values
rsqr(test$medv, yhat)

# Create a new variable that has all the columns of the test dataset # plus the residual variable
test_mod <- test %>% mutate(residual = medv - yhat)

# Visualise the residual plot
ggplot(test_mod, aes(x=medv, y=residual)) +
  geom_point() + 
  xlim(0, 60) + 
  ylim(-30,30) +
  geom_abline(slope = 0, intercept=0, col = "blue") + 
  ggtitle("Median house value vs. residual") +
  xlab("Median value") + 
  ylab("Residual")



