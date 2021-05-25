install.packages('factoextra')
library("factoextra")
#Data load
mydata1<-read.csv("/Volumes/Data/Course Content/DS content/Clustering/University Data Hierarchical clustering/Universities.csv")

################################
##data standardization
mydata <- scale(mydata1[,2:7])

d <- dist(mydata, method = "euclidean") #Computing the distance natrix
fit <- hclust(d, method="average") # Building the algorithm # try with 'centroid'

fviz_dend(fit, cex = 0.5) # cex: label size
# Cut in 4 groups and color by groups
fviz_dend(fit, k = 4, # Cut in four groups
          cex = 0.5, # label size
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)
#Attach the cluster numbers to Uni
clusters<-cutree(fit,k=4)
Final_output=data.frame('Uni'=mydata1[,1],'Cluster' =clusters)
View(Final_output)
