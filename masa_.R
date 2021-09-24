library(agricolae)
library(ExpDes.pt)


me <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/massa_paineis.txt",
  header = T)
x <- me$tratamento
y <- me$me
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
