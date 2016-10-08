######################################
#Collecting film meta-data - Box Office Mojo
library(XML) #Used to parse out film data

#List of distributors
dist <- as.list(c("buenavista", "fox", "a24","arcent", "focus", "lionsgate", "paramount", "sony","universal", "warnerbros", "weinsteincompany", "screengems", "ifc"))
dist.data <- list()

#Web Scraping Function
scrape.data <- function(x){
        urls <- paste0("http://www.boxofficemojo.com/schedule/?view=distributor&id=",x,".htm")
        input <- readHTMLTable(urls)[[1]]
        input.clean <- input[-c(1,2,3,4),]
        input.clean$dist <- c(x)
        names(input.clean) <- c("Movie", "Release.Date", "Distributor")
        dist.data[[x]] <- input.clean
        dist.data
}

#Applying scraping function to distributor list
release.list <- sapply(dist, scrape.data)

#Structuring and formating data
release.df <- do.call("rbind", release.list)
clean.data <- release.df[complete.cases(release.df),]
clean.data <- clean.data[ which(clean.data$Release.Date != "TBD"), ]
clean.data <- clean.data[ which(clean.data$Release.Date != "2016"), ]
clean.data <- clean.data[ which(clean.data$Release.Date != "2017"), ]
clean.data <- clean.data[ which(clean.data$Release.Date != "2018"), ]









