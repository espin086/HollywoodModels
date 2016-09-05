
#########################################
#Preparing data for cluster analysis

row.names(df) <- df[[1]] #make the name the row.name
df <- df[c(-1,-4:-6)] #Removing text of number 1 movie
df <- df[complete.cases(df),]
df <- scale(df, center = TRUE, scale = TRUE)#center and scale before clustering to ensure each variable is weighted equally in clustering exercise

##############################################
# Determine number of clusters
wss <- (nrow(df)-1)*sum(apply(df,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(df, 
                                     centers=i)$withinss)

plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

num.clust <- 4

##############################################
# Determine number of clusters

# K-Means Cluster Analysis
fit1 <- kmeans(df, num.clust) # 5 cluster solution
# get cluster means 
aggregate(df,by=list(fit1$cluster),FUN=mean)
# append cluster assignment
df <- data.frame(df, fit1$cluster)

##############################################
#Performing hCluster

# Ward Hierarchical Clustering
d <- dist(df, method = "euclidean") # distance matrix
fit2 <- hclust(d, method="ward.D") 
plot(fit2) # display dendogram
groups <- cutree(fit2, k=num.clust) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit2, k=num.clust, border="red")
df <- data.frame(df, groups)

##############################################
#Cluster visualizations

plot(df$Total.Gross, df$Num.Movies, col=df$fit1.cluster)
