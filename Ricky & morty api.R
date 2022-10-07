# installing packages
install.packages("dplyr")
install.packages("tidyr")

# importing library
library(dplyr)
library(tidyr)
library(httr)
library(jsonlite)

# accesing character data from Ricky&morty

json_file_1 <- "https://rickandmortyapi.com/api/character"
data <- jsonlite::fromJSON(json_file_1)

# converting into data frame

df1 = as.data.frame(data$results)
View(df1)

# saving into csv file

write.table(df1, file="df1.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(df1,'C:\Users\SALMAN KHAN\Documents\New folder\new_character.csv',row.names = FALSE)





# accesing Location data from Ricky&morty 

json_file_2 <- "https://rickandmortyapi.com/api/location"
data <- jsonlite::fromJSON(json_file_2)


df2 = as.data.frame(data$results)
View(df2)


write.table(df2, file="df2.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(df2,'C:/Users/SALMAN KHAN/Documents/new_location.csv',row.names = FALSE)



# accesing episode data from Ricky&morty

json_file_3 <- "https://rickandmortyapi.com/api/episode"
data <- jsonlite::fromJSON(json_file_3)


df3 = as.data.frame(data$results)
View(df3)

write.table(df3, file="df3.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(df3,'C:/Users/SALMAN KHAN/Documents/new_episode.csv',row.names = FALSE)

# converting data frame into unnested object using unnest() 

df1 = unnest(df1, episode)

# selecting top 5 character that appered most in seasons episode
final_top_5 = df1 %>% select(name,episode) %>% group_by(name) %>% summarise(count = n()) %>% arrange(desc(count)) %>% dplyr::top_n(5)
final_top_5

top = data.frame(final_top_5)




# sorting descending character that appered most in seasons episode
final_all = df1 %>% select(name,episode) %>% group_by(name) %>% summarise(count = n()) %>% arrange(desc(count)) 
final_all

top1 = data.frame(final_all)
write.table(top1, file="top1.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(top1,'C:/Users/SALMAN KHAN/Documents/top_character.csv',row.names = FALSE)


df_final = df1 %>% select(name,episode) %>% group_by(name,episode) %>% summarise(count = n()) 
View(df_final)


df_final = data.frame(df_final)
write.table(df_final, file="df_final.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(df_final,'C:/Users/SALMAN KHAN/Documents/df_top.csv',row.names = FALSE)
