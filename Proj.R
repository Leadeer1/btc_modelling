data<-read.csv("BTCprice1.csv", sep=";",dec=",")
head(data)

library(ggplot2)
library(car)
library(dplyr)
library(moments)
library(lmtest)


model<-lm(Price~VolumeM+Difficulty+BTCCirculation+InflationRateUS+GoogleTrends+HasMuskMentioned,data)


summary(model)

summary(data$Difficulty)

skewness(data$Difficulty)

kurtosis(data$Difficulty)

data$index<-1:nrow(data)
ggplot(data, aes(Difficulty,index))+geom_line()+geom_point()

hellwig_index <- function(subset) {
  if (length(subset) == 0) return(0)
  sum_r2 <- sum(cor_price[subset]^2)
  sum_interactions <- sum(abs(cor_par[subset, subset][lower.tri(cor_par[subset, subset])]))
  return(sum_r2 - sum_interactions)
}

predictor_indices <- 1:7
subsets <- unlist(lapply(1:length(predictor_indices), function(k) combn(predictor_indices, k, simplify = FALSE)), recursive = FALSE)
results <- sapply(subsets, hellwig_index)

results_table <- data.frame(
  Predictors = sapply(subsets, function(s) paste(colnames(cor_mat)[s + 1], collapse = ", ")),
  Hellwig_Index = results
)
results_table <- results_table[order(-results_table$Hellwig_Index), ]
best_subset <- subsets[[which.max(results)]]
best_H <- max(results)
best_predictors <- colnames(cor_mat)[-1][best_subset]

cat("Najbardziej informatywne parametry:", paste(best_predictors, collapse = ", "), "\n")
cat("Najwyższy indeks Hellwiga:", best_H, "\n")

data2<-subset(data, select = -c(USAvgKWHPrice))
cor_mat2<-cor(data2[-1])
print(cor_mat2)
cor_price2<-cor_mat2["Price", -1]
cor_par2<-cor_mat2[-1,-1]

data3<-subset(data2, select = -c(BTCCirculation))
cor_mat3<-cor(data3[-1])
print(cor_mat3)

cor_price3<-cor_mat3["Price", -1]
cor_par3<-cor_mat3[-1,-1]

print(cor_price3)
print(cor_par3)

hellwig_index <- function(subset) {
  if (length(subset) == 0) return(0)
  sum_r2 <- sum(cor_price2[subset]^2)
  sum_interactions <- sum(abs(cor_par2[subset, subset][lower.tri(cor_par2[subset, subset])]))
  return(sum_r2 - sum_interactions)
}

predictor_indices <- 1:6
subsets <- unlist(lapply(1:length(predictor_indices), function(k) combn(predictor_indices, k, simplify = FALSE)), recursive = FALSE)
results <- sapply(subsets, hellwig_index)

results_table <- data.frame(
  Predictors = sapply(subsets, function(s) paste(colnames(cor_mat2)[s + 1], collapse = ", ")),
  Hellwig_Index = results
)
results_table <- results_table[order(-results_table$Hellwig_Index), ]
best_subset <- subsets[[which.max(results)]]
best_H <- max(results)
best_predictors <- colnames(cor_mat2)[-1][best_subset]

cat("Najbardziej informatywne parametry:", paste(best_predictors, collapse = ", "), "\n")
cat("Najwyższy indeks Hellwiga:", best_H, "\n")

results_table <- results_table[order(-results_table$Hellwig_Index), ]
best_subset <- subsets[[which.max(results)]]
best_H <- max(results)
best_predictors <- colnames(cor_mat2)[-1][best_subset]

data4<-subset(data3, select = -c(InflationRateUS))
cor_mat4<-cor(data4[-1])
print(cor_mat4)

cor_price4<-cor_mat4["Price", -1]
cor_par4<-cor_mat4[-1,-1]

print(cor_price4)
print(cor_par4)


model2<-lm(Price~USAvgKWHPrice+GoogleTrends, data4)

summary(model2)

acf(model2$residuals)

pacf(model2$residuals)

VIF<-vif(model)
print(VIF)

shapiro.test(model2$residuals)

adf.test(data$Price)
kpss.test(data$Price)

resettest(model)

