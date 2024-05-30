# DATA DEFUNCIONES
library(dplyr)
library(lubridate)
library(readr)
data <- read.csv("C:/Users/Jose/Desktop/RESEARCH/Álvaro/FONDECYT/Data/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES.csv", 
                 header=FALSE, sep=";")
data <- data[,-1]
colnames(data) <- as.character(unlist(data[1, ]))
data <- data[-1, ]  # Elimina la primera fila
data2 <- data2 %>% 
  mutate(FECHA_DEF = as.Date(FECHA_DEF),
         year = year(FECHA_DEF)) %>% 
  filter(year >= 2008 & year <= 2019)


write_rds(data2, "C:/Users/Jose/Desktop/RESEARCH/Álvaro/FONDECYT/Data/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES/defunciones.RDS", compress = "gz")

# DATA SPLIT
data <- readRDS("C:/Users/Jose/Desktop/RESEARCH/Álvaro/FONDECYT/Data/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES/defunciones.RDS")

# Determine the size of the dataset
n <- nrow(data)

# Choose a split point, here we split the data into two equal parts, if possible
split_point <- round(n / 2)

# Split the data into two parts
part1 <- data[1:split_point, ]
part2 <- data[(split_point + 1):n, ]

# Optionally, save the subsets to RDS files
write_rds(part1, "C:/Users/Jose/Desktop/RESEARCH/Álvaro/FONDECYT/Data/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES/defunciones1.RDS", compress = "gz")
write_rds(part2, "C:/Users/Jose/Desktop/RESEARCH/Álvaro/FONDECYT/Data/DEFUNCIONES_FUENTE_DEIS_1990_2021_CIFRAS_OFICIALES/defunciones2.RDS", compress = "gz")




