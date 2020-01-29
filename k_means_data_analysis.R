rm(list=ls())
#business problem: Identify potential customers for marketing campign
getwd()
#load the kmeans data
kmeans1=read.csv("Kmeans data.csv")

#Extract those columns income and spending score
head(kmeans1)
head(kmeans1,3)
data1=kmeans1[4:5]
head(data1,3)
#to find number of clustors  in the dataset( use elbow method)
help(kmeans)
# withinss:Vector of within-cluster sum of squares, one component per cluster.
WCSS=vector()
for(i in 1:10)
WCSS[i]=sum(kmeans(data1,i)$withinss)
help(plot)
plot(1:10, WCSS, type='b', xlab="no of clustors", ylab="WCSS")
#elbow point is: 5
km=kmeans(data1,5)

#Visualize clusters
#install.packages("cluster")
library(cluster)
clusplot(data1, km$cluster, lines = 0, shade = TRUE, 
         color=TRUE,labels=2, xlab = 'Annual Income', ylab='Spending score')



final_data=cbind(data1, km$cluster)
potential_customers=subset(data1, km$cluster==3)
table(km$cluster)
