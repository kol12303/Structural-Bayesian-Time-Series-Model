#install.packages("CausalImpact")
library(CausalImpact)
library(readxl)
Mainsheet_5 <- read_excel("C:/Users/LOKMAN/Desktop/Mainsheet_5.xlsx", 
                          sheet = "Egypt")

# Model to Run
Egypt_normal <- zoo(cbind(Mainsheet_5$change))
#
pre.period <-c(1, 91)
#
post.period <-c(92,320)
#Estimate the Model
Egypt_n <- CausalImpact(Egypt_normal, pre.period, post.period)
summary(Egypt_n)
summary(Egypt_n, "report")
Egypt_n$summary
library(ggplot2)
Egypt_n.plot <- plot(Egypt_n) + theme_bw(base_size = 20)
plot(Egypt_n.plot)

#                       Robusteness using Stock Return (change)
Mainsheet_5 <- read_excel("C:/Users/LOKMAN/Desktop/Mainsheet_5.xlsx", 
                          sheet = "Egypt")

Egypt_robust<- zoo(cbind(Mainsheet_5$change,Mainsheet_5$total_deaths,Mainsheet_5$total_cases,Mainsheet_5$stringency))
pre.period <-c(1, 91)
#
post.period <-c(92,320)
Egypt_rob <- CausalImpact(Egypt_robust, pre.period, post.period)
summary(Egypt_rob)
summary(Egypt_rob, "report")
Egypt_rob$summary
library(ggplot2)
Egypt_rob.plot <- plot(Egypt_rob) + theme_bw(base_size = 20)
plot(Egypt_rob.plot)
#                       Robusteness using liquidity
library(CausalImpact)
library(readxl)
Mainsheet_5 <- read_excel("C:/Users/LOKMAN/Desktop/Mainsheet_5.xlsx", 
                          sheet = "Egypt")

Egypt_liquidity<- zoo(cbind(Mainsheet_5$liquidity,Mainsheet_5$total_deaths,Mainsheet_5$total_cases,Mainsheet_5$stringency))
set.seed(3)
pre.period <-c(1, 91)
#
post.period <-c(92,320)
Egypt_rob2 <- CausalImpact(Egypt_liquidity, pre.period, post.period)
summary(Egypt_rob2)
summary(Egypt_rob2, "report")
Egypt_rob2$summary
library(ggplot2)
Egypt_rob2.plot <- plot(Egypt_rob2) + theme_bw(base_size = 20)
plot(Egypt_rob2.plot)

