## Inchamento e absorção de água 2h
library(multcompView)

#inchamento em lateral
inchamento <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/ilateral.txt",
  header = T)
x <- inchamento$tratamento
y <- inchamento$sw2
dados <- data.frame(x,y)
str(dados)


modelo.anova <- lm(y ~ x, data= dados)
summary(modelo.anova)
anova(modelo.anova) 
modelo.anova2 <- aov(y ~ x, data= dados)

medias <- with(dados,tapply(y,x,mean)) 
erro <- with(dados,
             tapply(y,x,function(x) sqrt(var(x)/length(x))))

TukeyHSD(modelo.anova2)
plot(modelo.anova)


