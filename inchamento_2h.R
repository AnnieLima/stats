# Inchamento e absorção de água 2h
library(agricolae)
library(ExpDes.pt)


#inchamento em espessura
inchamento <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/iespessura.txt",
  header = T)
x <- inchamento$tratamento
y <- inchamento$sw2
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


#inchamento LATERAL
inchamentol <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/ilateral.txt",
  header = T)
x <- inchamentol$tratamento
y <- inchamentol$sw2
dadosl <- data.frame(x,y)

dic(
  x,
  y,
  quali = TRUE,
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05
)


#absorção
absorcao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/absorcao.txt",
  header = T)
x <- absorcao$tratamento
y <- absorcao$sw2
dadosab <- data.frame(x,y)

dic(
  x,
  y,
  quali = TRUE,
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05
)
