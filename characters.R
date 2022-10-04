library(httr)
library(jsonlite)

## Ricky and Morty building url

base_url <- "https://rickandmortyapi.com/api/"
info_url <- "character"
full_url <- base::paste0(base_url,info_url)
full_url

## calling API
api_call <- httr::GET(full_url)

## API response

api_call$status_code
api_call$content

## convert reponse into usable data

api_char <- base::rawToChar(api_call$content)

api_json <- jsonlite::fromJSON(api_char)
api_json

df <- api_json$results

x = api_json['results']
x

## converting data into data frame 
data <- data.frame(x)
data <- head(data)
data1<-data.frame(lapply(data, as.character), stringsAsFactors=FALSE)
data1

## saving file into csv file
write.table(data1, file="data1.csv", row.names=FALSE, na="", col.names = FALSE, sep=",")


write <- write.csv(data1,'C:/Users/SALMAN KHAN/Documents/characters.csv',row.names = FALSE)



