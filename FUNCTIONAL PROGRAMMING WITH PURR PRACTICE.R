library(tidyverse)
library(haven)

civil_rights <- read_dta("cirights.dta")

canada_data = civil_rights %>% 
  filter(country == "Canada")

double <- function(value){
  value * 2
}

double_speech <- canada_data %>% pull(speech) %>% 
  map_dbl(double)

double_speech


mean_average <- function(df_col){
  mean(df_col,na.rm=TRUE)
}

canada_data %>% select(-country) %>% 
  map_df(mean_average) %>% t() 

canada_data %>% select(-country) %>% 
  map_dbl(mean_average)  

civil_rights %>% filter(year==2019) %>% write.csv(file = "cirights_2019.csv",
                                                  row.names = FALSE)


civil_rights %>% filter(year==2020) %>% write.csv(file = "cirights_2020.csv",
                                                  row.names = FALSE)

civil_rights %>% filter(year==2021) %>% write.csv(file = "cirights_2021.csv",
                                                  row.names = FALSE)

filenames <- c("cirights_2019.csv","cirights_2020.csv","cirights_2021.csv")

read_csv_to_df <- function(filename){
  read_csv(filename)
}
cirights_2019_2021 <- filenames %>% map_df(read_csv_to_df)

european_countries <- list(
  civil_rights %>% filter(country == "Norway") %>% select(-country),
  civil_rights %>% filter(country == "Sweden") %>% select(-country), 
  civil_rights %>% filter(country == "France") %>% select(-country), 
  civil_rights %>% filter(country == "Italy") %>% select(-country) 
)


summarize_columns <- function(df){
  map_dbl(df, mean_average)
}

 summary_europe <- european_countries %>% 
   map_df(summarize_columns)

 view(summary_europe)



 cirights_2019_2021 %>%
   group_by(country,year) %>% 
   summarise(mean_HR_score = mean(human_rights_score,na.rm = TRUE)) %>% 
   arrange(desc(mean_HR_score))
 
 
 cirights_2019_2021 %>%
   group_by(year,country) %>% 
   summarise(mean_HR_score = mean(human_rights_score,na.rm = TRUE)) %>% 
   arrange(desc(mean_HR_score)) 


cirights_2019_2021 %>%
  summarise(mean_HR_score = mean(human_rights_score,na.rm = TRUE),
            .by = c(country,year)) %>% 
  arrange(desc(mean_HR_score)) %>% 
  ungroup()


cirights_2019_2021 %>%
  summarise(mean_HR_score = mean(human_rights_score,na.rm = TRUE),
            .by = c(country,year)) %>%  
  slice_max(mean_HR_score, n = 10) %>% 
  ggplot(aes(x = reorder(country,-mean_HR_score), y= mean_HR_score, fill = country))+
  geom_bar(stat = "identity")+
  coord_flip()+
  labs(x = "Country", y = "Average Human Rights Score")+
  scale_fill_viridis_d(option = "viridis")+
  theme(theme_bw(),legend.position = "none")


  






































