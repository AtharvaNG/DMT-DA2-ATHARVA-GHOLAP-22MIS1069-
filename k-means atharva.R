
library(ggplot2)
library(dplyr)


data <- data.frame(
  ID = 1:35,
  Age = c(25, 35, 42, 28, 50, 33, 45, 29, 38, 31, 27, 48, 36, 40, 34, 26, 39, 43, 32, 46, 
          30, 29, 37, 44, 35, 51, 28, 49, 31, 36, 40, 35, 48, 29, 47),
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Male", "Female", 
             "Male", "Female", "Male", "Male", "Female", "Female", "Male", "Female", "Male", 
             "Female", "Male", "Male", "Female", "Male", "Male", "Female", "Female", "Male", 
             "Female", "Male", "Male", "Female", "Male", "Female", "Female", "Male"),
  BMI = c(23.1, 22.0, 26.1, 21.5, 31.1, 20.9, 26.8, 26.4, 24.8, 26.8, 21.5, 28.4, 27.5, 24.9, 
          23.3, 26.0, 23.8, 26.8, 22.1, 28.1, 26.1, 22.9, 27.4, 27.5, 23.1, 25.9, 26.7, 25.4, 
          23.7, 27.5, 28.4, 22.9, 25.6, 25.9, 28.1),
  stringsAsFactors = FALSE
)


data$Gender <- as.numeric(factor(data$Gender))


set.seed(123) 
kmeans_result <- kmeans(data[, c("Age", "Gender", "BMI")], centers = 3, nstart = 20)


data$Cluster <- as.factor(kmeans_result$cluster)


ggplot(data, aes(x = Age, y = BMI, color = Cluster)) +
  geom_point() +
  facet_wrap(~Gender) +
  labs(title = "K-means Clustering of BMI by Age and Gender",
       x = "Age", y = "BMI",
       color = "Cluster") +
  theme_minimal()
