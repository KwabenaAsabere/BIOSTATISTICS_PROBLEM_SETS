
library(tidymodels)
library(tidyverse)
tidymodels_prefer()
theme_set(theme_bw())
data(ames)

ames <- ames %>% 
  mutate(Sale_Price=log10(Sale_Price))

ames %>% 
  ggplot(aes(x=Sale_Price))+
  geom_histogram(color= "white")

ames_split <- initial_split(ames,prop = 0.8)
ames_train <- training(ames_split)
ames_test <- testing(ames_split)

set.seed(1001)
ames_folds <- vfold_cv(ames_train, v = 10)

ames_folds$splits
ames_folds$splits[[1]]

## To get the data frame corresponding to the training part use the function analysis

ames_folds$splits[[1]] %>% analysis()
ames_folds$splits[[1]] %>% assessment()

## repeat cross validation multiple times to get better estimates of 
## model parameters

rep_ames_folds <- vfold_cv(ames_train, v= 10, repeats = 5)

rep_ames_folds

print(rep_ames_folds, n=40)


## Cross Validation
mc_cv(ames_train, prop = 9/10, times = 20)






























































































































































