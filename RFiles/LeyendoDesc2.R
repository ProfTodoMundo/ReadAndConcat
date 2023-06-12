setwd("~/Desktop/TemporalEnsamble")
library(readr)
WebAddress <- read_csv("WebAddress.csv")
View(WebAddress)
datos <- WebAddress


wtime <- 10*60
for (i in 4:25) {
  indice <- 25-i+1
  url <- datos$URLS[i]
  browseURL(url)
  print(paste("Tarea", indice, "- Hora de inicio:", Sys.time()))
  Sys.sleep(wtime)
  }


i <- 21
i <- 20
i <- 19
i <- 18
i <- 17
i <- 16
i <- 15
i <- 14
i <- 13
i <- 12
i <- 11
i <- 10
i <- 9
i <- 8
i <- 7
i <- 6
i <- 5
i <- 4
i <- 3
i <- 2
i <- 1
i <- 22
i <- 23
i <- 24
i <- 25
url <- datos$URLS[i]
browseURL(url)
print(paste("Tarea", i, "- Hora de inicio:", Sys.time()))


for (i in 6:10) {url <- datos$URLS[i]; browseURL(url); Sys.sleep(waitingtime)}
for (i in 11:15) {url <- datos$URLS[i]; browseURL(url); Sys.sleep(waitingtime)}
for (i in 16:20) {url <- datos$URLS[i]; browseURL(url); Sys.sleep(waitingtime)}
for (i in 21:25) {url <- datos$URLS[i]; browseURL(url); Sys.sleep(waitingtime)}


for (i in 2:5){  url <- datos$URLS[i];browseURL(url)}
for (i in 6:10){ url <- datos$URLS[i];browseURL(url)}
for (i in 11:15){url <- datos$URLS[i];browseURL(url)}
for (i in 16:20){url <- datos$URLS[i];browseURL(url)}
for (i in 21:25){url <- datos$URLS[i];browseURL(url)}
