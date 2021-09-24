library(corrplot)

#Sibipiruna
correlacao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/fisica_corr.txt",
  header = T)
correlacao
row.names(correlacao)
dados <- correlacao[, c(-1)]
summary (dados)
res <- cor(dados)
round(res, 2)
corrplot(cor(dados), method = "circle")


#Flanboyant
correlacao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/fisica_corre.txt",
  header = T)
correlacao
row.names(correlacao)
dados1 <- correlacao[, c(-1)]
summary (dados1)
res <- cor(dados1)
round(res, 2)
corrplot(cor(dados1), method = "circle")
