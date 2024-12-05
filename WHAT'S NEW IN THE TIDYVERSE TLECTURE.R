library(tidyverse)
library(palmerpenguins)
theme_set(theme_bw())

penguins %>% 
  drop_na(sex,body_mass_g) %>% 
  group_by(species,sex) %>% 
  summarise(
    mean_bw = mean(body_mass_g),
    .groups = "drop"
  ) %>% 
  ggplot(aes(x = species,y = mean_bw,fill = sex))+
  geom_col(position = "dodge")+
  labs(y = "Mean body weight", fill = "Sex")
 # scale_fill_viridis_d(option = "viridis")


penguins %>% 
  drop_na(sex,body_mass_g) %>% 
  group_by(species,sex) %>% 
  summarise(
    mean_bw = mean(body_mass_g),
    .groups = "drop"
  ) %>%
  gt::gt()



penguins %>% 
  drop_na(sex,body_mass_g) %>% 
  summarise(
    mean_bw = mean(body_mass_g),
    .by = c(species,sex)
  ) 

penguins <- penguins %>% 
  reframe(bm_cat = quantile(body_mass_g,c(0.25,0.75),na.rm = TRUE))

penguins %>% 
  mutate(bm_cat = 
           case_when(
             is.na(body_mass_g) ~ NA,
             body_mass_g < 3550 ~ "Small",
             between(body_mass_g,3550,4750) ~ "Medium",
             .default = "Large"
           )
  ) %>% 
  relocate(body_mass_g,bm_cat)





























































































































































































