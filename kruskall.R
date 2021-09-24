library(agricolae)
library(ExpDes.pt)


#inchamento em espessura 2h
inchamento <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/iespessura.txt",
  header = T)
x <- inchamento$tratamento
y <- inchamento$sw2
dados_ie2 <- data.frame(x,y)

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)

#inchamento em espessura 24h
inchamento <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/iespessura.txt",
  header = T)
x <- inchamento$tratamento
y <- inchamento$sw24
dados_ie24 <- data.frame(x,y)

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)

#inchamento LATERAL 24h
inchamentol <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/ilateral.txt",
  header = T)
x <- inchamentol$tratamento
y <- inchamentol$sw24
dados_il24 <- data.frame(x,y)

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)

#absorção 2h
absorcao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/absorcao.txt",
  header = T)
x <- absorcao$tratamento
y <- absorcao$sw2
dadosab2 <- data.frame(x,y)

kruskal(y, x, 
        alpha = 0.05, 
        p.adj=c("bonferroni"), 
        group=TRUE, main = NULL,console=TRUE)


