
library(cluster)
library(dplyr)


data <- data.frame(
  ID = 1:35,
  Height_cm = c(180, 165, 175, 160, 170, 155, 178, 172, 168, 175, 163, 183, 179, 170, 167, 
                172, 169, 176, 162, 181, 174, 166, 177, 180, 164, 168, 173, 172, 167, 178, 
                179, 163, 170, 171, 177),
  Weight_kg = c(75, 60, 80, 55, 90, 50, 85, 78, 70, 82, 57, 95, 88, 72, 65, 77, 68, 83, 58, 
                92, 79, 63, 86, 89, 62, 73, 80, 75, 66, 87, 91, 61, 74, 76, 88),
  BMI = c(23.1, 22.0, 26.1, 21.5, 31.1, 20.9, 26.8, 26.4, 24.8, 26.8, 21.5, 28.4, 27.5, 24.9, 
          23.3, 26.0, 23.8, 26.8, 22.1, 28.1, 26.1, 22.9, 27.4, 27.5, 23.1, 25.9, 26.7, 25.4, 
          23.7, 27.5, 28.4, 22.9, 25.6, 25.9, 28.1),
  stringsAsFactors = FALSE
)


kmeans_result <- kmeans(data[, -1], centers = 3, nstart = 20)


clara_result <- clara(data[, -1], k = 3)


print("K-means Cluster Centers:")
print(kmeans_result$centers)
print("CLARA Cluster Centers:")
print(clara_result$medoids)


print("K-means Cluster Sizes:")
print(table(kmeans_result$cluster))
print("CLARA Cluster Sizes:")
print(table(clara_result$clustering))
