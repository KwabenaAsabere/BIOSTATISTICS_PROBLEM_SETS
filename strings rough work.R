library(tidyverse)
theme_set(theme_bw())

taylorswift <- read_csv("https://raw.githubusercontent.com/dilernia/STA418-518/main/Data/swiftSongs.csv")


taylorswift  
  
  
  smoking <- read_csv("smoking.csv")
head(smoking)

taylorswift <-taylorswift %>% 
  mutate(lyrics = str_to_lower(full_lyrics)) 

taylorswift %>% 
  pull(lyrics) %>% 
  str_detect(pattern = "midnight") %>% 
  sum()

taylorswift <- taylorswift %>% 
  mutate(heart_count = str_count(lyrics,pattern = "heart"))

taylorswift %>% 
  slice_max(heart_count, n = 5) %>% 
  select(track_name,heart_count)


str_sub(string = "Biostatistics", start = 4,end = -1)

str_replace_all("biostatistics",
                pattern = "bio",
                replacement = "Geo")

 
taylorswift <-taylorswift %>% 
 mutate(lyrics =  str_replace_all(lyrics, pattern = "love", replacement = "LOVE"),
 LOVE_count =  str_count(lyrics,pattern = "LOVE")) 

taylorswift %>% 
  ggplot(aes(x = reorder(album_name,-youtube_view_count), y = youtube_view_count))+
  geom_col(aes(fill = album_name))+
  scale_fill_viridis_d()+
  labs(y = "YouTube Views", x = "Album Name")+
  theme_bw()+
  theme(legend.position = "none")



taylorswift %>% 
  filter(youtube_view_count < 1e+09) %>% 
  ggplot(aes(x = youtube_view_count, y = youtube_like_count))+
  geom_point(aes(color = album_name))+
  scale_color_viridis_d(option = "viridis")+
  theme(legend.position = "none")+
  geom_smooth(method = "lm", se = FALSE)





d <- "The dog is fat"

str_detect(d,"dog")

x <- " Ama is a girl,"
y <-  "Kofi is a boy"

str_c(x,y, sep = " ") 


phone <- "800-800-8553"

## first match
str_replace(phone,pattern = "800-", replacement = "")

## all matches
str_replace_all(phone,pattern = "800-", replacement = "")


str_view(phone,pattern = "800-")

  
   
   
  


































































































































































