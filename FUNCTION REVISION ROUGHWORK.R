library(tidyverse)
theme_set(theme_bw())
framingham_bins <- read_csv("FraminghamPS4bin.csv")
framingham <- read_csv("framingham.csv")


scatter_plot <- function(var_1,var_2){
  framingham %>% na.omit() %>% 
    ggplot(aes( x = {{var_1}}, y = {{var_2}}))+
    geom_point(aes(color = male))+
    theme(theme_bw())
}


scatter_plot(BMI,glucose)


scatter_plot(age,BMI)


box_plot <- function(var_1,var_2){
  framingham %>% na.omit() %>% 
    ggplot(aes( x = as.factor({{var_1}}), y = {{var_2}}, fill = {{var_1}}))+
    geom_boxplot()+
    theme(theme_bw())
    #scale_fill_viridis_c(option = "viridis")
}

box_plot(education,totChol)
box_plot(diabetes,BMI)

framingham %>% na.omit() %>% 
  ggplot(aes( x = as.factor(education), y = totChol, fill =education))+
  geom_boxplot()+
  theme(theme_bw())+
 scale_fill_manual(values = c( "red", "blue",  "green", "grey"))



framingham %>%
  na.omit() %>%
  mutate(education = as.factor(education)) %>%
  ggplot(aes(x = education, y = totChol, fill = education)) +
  geom_boxplot() +
  theme_bw() +
  scale_fill_manual(values = c("mediumpurple1", "lightgrey", "darkgrey", "grey"))

framingham %>% 
  ggplot(aes(x = totChol))+
  geom_histogram(fill = "mediumpurple1",color = "black")+
  geom_freqpoly(linewidth = 1,col="red")+
  labs(title = "Histogram with Frequency Polygon",
       x = "Total Cholesterol",
       y = "Frequency")


framingham %>% 
  ggplot(aes(x = BMI))+
  geom_histogram(fill = "lightgrey",color = "black")+
  geom_freqpoly(linewidth = 1)+
  labs(title = "Histogram with Frequency Polygon",
       x = "BMI",
       y = "Frequency")


framingham %>% 
  ggplot(aes(x = sysBP))+
  geom_histogram(fill = "lightgrey",color = "black")+
 # geom_freqpoly(linewidth = 1)+
  labs(title = "Histogram with Frequency Polygon",
       x = "Systolic BP",
       y = "Frequency")















































































































































































