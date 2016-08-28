library(reshape) #Used to rename variables

###################################
#Importing original dataset
data("appleProdFr86", package = "micEcon")

#Produces help menu for original datase on French Apple producers
help("appleProdFr86", package = "micEcon")


###################################
#Data Dictionary

#vCap costs of capital (including land)
#vLab costs of labor (including remuneration of unpaid family labor)
#vMat costs of intermediate materials (e.g. seedlings, fertilizer, pesticides, fuel) 
#qOut quantity index of all outputs (apples and other outputs)
#pCap price index of capital goods
#pLab price index of labor
#pMat price index of materials
#pOut price index of the aggregate outputú
#adv use of advisory serviceú

###################################
#Renaming data for entertainment industry example

appleProdFr86 <- rename(appleProdFr86, c(vCap = "vProps")) #props/equipment in a movie can be considered capital expenses

appleProdFr86 <- rename(appleProdFr86, c(vLab = "vDirector")) #directors/producers can be though of as the labor going into the film

appleProdFr86 <- rename(appleProdFr86, c(vMat = "vActors")) #actors/actress can be thought of as the raw materials in a film that are modeled by the director and props/equipment

appleProdFr86 <- rename(appleProdFr86, c(qApples = "qAdmission")) #number of tickets sold for a movie may be considered the 'main' output of a film product

appleProdFr86 <- rename(appleProdFr86, c(qOtherOut = "qHomeEnt")) #number of home entertainment sales/rentals may be considered other output from a film

appleProdFr86 <- rename(appleProdFr86, c(qOut = "qTotalView")) #Box office and rentals can be considered the total viewership of a film

appleProdFr86 <- rename(appleProdFr86, c(pCap = "pProps")) #price of capital may be considered the rental rate of props (hr?)

appleProdFr86 <- rename(appleProdFr86, c(pLab = "pDirector")) #price of labor may be the contractual wage of a director per unit of labor (hr?)

appleProdFr86 <- rename(appleProdFr86, c(pMat = "pActors")) #price of materials may be the contractual wage of an actor per unit of work (hr?)

appleProdFr86 <- rename(appleProdFr86, c(pOut = "pTotalView")) #price of total output may be the weighted price of admission and home entertainment 

#Abbreviating the name of the dataset
dat <-appleProdFr86

###################################
#Calculating input quantities by dividing total costs on input by input price
dat$qProps <- dat$vProps / dat$pProps
dat$qDirector <- dat$vDirector / dat$pDirector
dat$qActors <- dat$vActors / dat$pActors

###################################
#Deriving cost measures

#Total costs
dat$cost <- with( dat, vProps + vDirector + vActors )

#Variable costs
dat$vCost <- with( dat, vDirector + vActors )


###################################
#Deriving profit and gross margins
dat$profit <- with(dat, pTotalView * qTotalView - cost)

#If capital is a quasi-fixed input and labor and materials are variable inputs, the movie producers’ gross margins can be calculated by following command:

dat$vProfit <- with( dat, pTotalView * qTotalView - vDirector - vActors )
