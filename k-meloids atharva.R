
library(cluster)
library(dplyr)


data <- data.frame(
  ID = 1:35,
  Height_cm = c(180, 165, 175, 160, 170, 155, 178, 172, 168, 175, 163, 183, 179, 170, 167, 
                172, 169, 176, 162, 181, 174, 166, 177, 180, 164, 168, 173, 172, 167, 178, 
                179, 163, 170, 171, 177),
  Weight_kg = c(75, 60, 80, 55, 90, 50, 85, 78, 70, 82, 57, 95, 88, 72, 65, 77, 68, 83, 58, 
                92, 79, 63, 86, 89, 62, 73, 80, 75, 66, 87, 91, 61, 74, 76, 88),
  stringsAsFactors = FALSE
)


kmeans_result <- kmeans(data, centers = 3, nstart = 20)


kmedoids_result <- pam(data, k = 3)


kmeans_silhouette <- silhouette(kmeans_result$cluster, dist(data))
kmedoids_silhouette <- silhouette(kmedoids_result$clustering, dist(data))


print("K-means Silhouette Score:")
print(mean(kmeans_silhouette[, "sil_width"]))
print("K-medoids Silhouette Score:")
print(mean(kmedoids_silhouette[, "sil_width"]))
