#Create data in forms of returns
library(zoo)
library(reshape)
library(DataCombine)

#Calculating losses and gains
tickers <- names(stocks)

#Recoding into binary if stock price went up
stocks$DIS[stocks$DIS > 0] <- 1
stocks$DIS[stocks$DIS < 0] <- 0


#Take lags of stock time series variable
for (i in 1:length(tickers)){
        #stocks[i] <- Delt(stocks[i])
        for (j in 1:6){
                stocks[i] <- Delt(stocks[i])
                stocks <- slide(stocks, Var = names(stocks[i]), slideBy = -j)      
        }
}






