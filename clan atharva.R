
data <- read.table(text = "
ID Age Gender Height Weight BMI BloodPressure
1 25 Male 180 75 23.1 120/80
2 35 Female 165 60 22.0 110/70
3 42 Male 175 80 26.1 130/85
4 28 Female 160 55 21.5 115/75
5 50 Male 170 90 31.1 140/90
6 33 Female 155 50 20.9 105/65
7 45 Male 178 85 26.8 125/80
8 29 Male 172 78 26.4 128/82
9 38 Female 168 70 24.8 118/78
10 31 Male 175 82 26.8 130/85
11 27 Female 163 57 21.5 112/72
12 48 Male 183 95 28.4 135/88
13 36 Male 179 88 27.5 128/83
14 40 Female 170 72 24.9 120/78
15 34 Female 167 65 23.3 118/75
16 26 Male 172 77 26.0 125/80
17 39 Female 169 68 23.8 122/78
18 43 Male 176 83 26.8 130/85
19 32 Female 162 58 22.1 114/73
20 46 Male 181 92 28.1 138/88
21 30 Male 174 79 26.1 127/82
22 29 Female 166 63 22.9 116/76
23 37 Male 177 86 27.4 129/84
24 44 Male 180 89 27.5 132/86
25 35 Female 164 62 23.1 119/77
26 51 Female 168 73 25.9 123/79
27 28 Male 173 80 26.7 128/83
28 49 Female 172 75 25.4 126/81
29 31 Female 167 66 23.7 121/78
30 36 Male 178 87 27.5 131/85
31 40 Male 179 91 28.4 133/87
32 35 Female 163 61 22.9 117/76
33 48 Female 170 74 25.6 124/80
34 29 Male 171 76 25.9 124/80
35 47 Male 177 88 28.1 135/88
", header = TRUE)


cluster_data <- data[, c("Age", "Height", "Weight", "BMI")]


dist_matrix <- dist(cluster_data)


hclustering <- hclust(dist_matrix, method = "complete")


plot(hclustering)
