library(agricolae)
library(ExpDes.pt)

#MOE
flexão <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/flexao_paineis.txt",
  header = T)
x <- flexão$tratamento
y <- flexão$MOE
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

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)

#MOR
flexão_ <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/flexao_paineis.txt",
  header = T)
x <- flexão_$tratamento
y <- flexão_$MOR
dado1 <- data.frame(x,y)

dic(
  x,
  y,
  quali = TRUE,
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05
)

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)
