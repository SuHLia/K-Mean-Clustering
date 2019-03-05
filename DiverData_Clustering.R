library(cluster)

# set working directory
setwd("C:/Users/Suhong Liang/Desktop/JupyterNote/Lab5_clustering")
#getwd()

# loading data
driver_data = read.csv(file= "driver-data.csv")

# set the id as index
rownames(driver_data) <- driver_data$id

# remove id column
driver_data_new <- subset(driver_data, select = c(2, 3))

#check whether the dataframe has missing data
colSums(is.na(driver_data_new))

# check wss in different clustering numbers
wss = NULL
for (i in 1:10)
{
  set.seed(0)
  kmeans_temp = kmeans(driver_data_new, centers = i)
  wss[i] = sum(kmeans_temp$withinss)
}

plot(1:10, wss, type="b", xlab="Number of Clusters", ylab="wss")

set.seed(0)

#create a 2 clusters k-mean model
kmeans_Model = kmeans(driver_data_new, 2)
str(kmeans_temp)
kmeans_temp[[1]]
kmeans_Model$size

clusplot(x=driver_data_new,clus = kmeans_Model$cluster,color=T,labels=2,lines =0,main="Clustering", sub = "2 Cluster Model")

DiverData_Final = cbind(driver_data_new,Cluster = kmeans_Model$cluster)
colnames(DiverData_Final)

Cluster_Summary = aggregate(cbind(mean_dist_day, mean_over_speed_perc)~ Cluster, data = DiverData_Final, FUN = "mean")
Cluster_Summary
