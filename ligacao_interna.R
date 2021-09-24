library(agricolae)
library(ExpDes.pt)

#Ligação Interna - Tração
tração <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/ligacao.txt",
  header = T)
x <- tração$tratamento
y <- tração$tracao
dados <- data.frame(x,y)

dic(
  x,
  y,
  quali = TRUE,
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05
)


#Ligação Interna - MOR
módulo <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/ligacao.txt",
  header = T)
x <- módulo$tratamento
y <- módulo$MOR
data <- data.frame(x,y)

dic(
  x,
  y,
  quali = TRUE,
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05
)

