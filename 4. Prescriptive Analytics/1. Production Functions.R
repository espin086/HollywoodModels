####################
#Calculating average products

dat$apProps<- dat$qTotalView / dat$qProps
dat$apDirector <- dat$qTotalView / dat$qDirector
dat$apActors <- dat$qTotalView / dat$qActors

hist(dat$apProps, col = "red", main = "Output Per Prop", xlab = "Average Product of Props", ylab = "Number of Movies")

hist(dat$apDirector, col = "red", main = "Output Per Director", xlab = "Average Product of Directors", ylab = "Number of Movies")

hist(dat$apActors, col = "red", main = "Output Per Actor", xlab = "Average Product of Actors", ylab = "Number of Movies")
