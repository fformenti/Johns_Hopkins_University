data <- read.csv("hw1_data.csv", header = TRUE, sep = ",")

head(data,2)

tail(data,2)

data$Ozone[47]

#question 16
ans <- data[is.na(data$Ozone),]
nrow(ans)

#question 17
ans <- data[!(is.na(data$Ozone)), c("Ozone")]
mean(Ozone.treated)

#question 18
ans <- data[data$Ozone>31 & data$Temp>90,]
ans <- ans[!is.na(ans$Solar.R),]
mean(ans$Solar.R)

#question 19
ans <- data[data$Month==6 ,]
ans <- ans[!is.na(ans$Temp),]
mean(ans$Temp)

#question 20
ans <- data[data$Month==5 ,]
ans <- ans[!is.na(ans$Ozone),]
max(ans$Ozone)

