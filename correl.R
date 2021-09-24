library(corrplot)
library(GGally)
library(corrgram)

#Sibipiruna
correlacao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/fisica_corr.txt",
  header = T)
correlacao
row.names(correlacao)
dados <- correlacao[, c(-1)]
  
  #plot 1
    knitr::kable(cor(dados))
    pairs(dados)
    
  #plot 2
    panel.hist <- function(x, ...)
    {
      usr <- par("usr"); on.exit(par(usr))
      par(usr = c(usr[1:2], 0, 1.5) )
      h <- hist(x, plot = FALSE)
      breaks <- h$breaks; 
      nB <- length(breaks)
      y <- h$counts; y <- y/max(y)
      rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
    }
    pairs(dados , diag.panel = panel.hist)
    
  #plot 3
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
    {
      usr <- par("usr"); on.exit(par(usr))
      par(usr = c(0, 1, 0, 1))
      r <- abs(cor(x, y))
      txt <- format(c(r, 0.123456789), digits = digits)[1]
      txt <- paste0(prefix, txt)
      if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
      text(0.5, 0.5, txt, cex = cex.cor * r)
    }
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor)
    
  #plot 4
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor,
          lower.panel = panel.smooth)
    
    panel.lm <- function (x, y, col = par("col"), bg = NA, pch = par("pch"), 
                          cex = 1, col.line="red") {
      points(x, y, pch = pch, col = col, bg = bg, cex = cex)
      ok <- is.finite(x) & is.finite(y)
      if (any(ok)) {
        abline(lm(y[ok]~x[ok]), col = col.line)
      }
    }
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor,
          lower.panel = panel.lm)
    
  #plot 5
    ggpairs(dados, lower = list(continuous = "smooth"))
    
  #plot 6
    ggpairs(correlacao, columns = 2:8, ggplot2::aes(colour=Especie))
    
  #plot 7
    corrgram(dados, 
             lower.panel = panel.pts, 
             upper.panel= panel.conf, 
             diag.panel = panel.density)
  
    
#Flanboyant
    correlacao <- read.table(
      "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/fisica_corre.txt",
      header = T)
    correlacao
    row.names(correlacao)
    dados <- correlacao[, c(-1)]
    
    #plot 1
    knitr::kable(cor(dados))
    pairs(dados)
    
    #plot 2
    panel.hist <- function(x, ...)
    {
      usr <- par("usr"); on.exit(par(usr))
      par(usr = c(usr[1:2], 0, 1.5) )
      h <- hist(x, plot = FALSE)
      breaks <- h$breaks; 
      nB <- length(breaks)
      y <- h$counts; y <- y/max(y)
      rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
    }
    pairs(dados , diag.panel = panel.hist)
    
    #plot 3
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
    {
      usr <- par("usr"); on.exit(par(usr))
      par(usr = c(0, 1, 0, 1))
      r <- abs(cor(x, y))
      txt <- format(c(r, 0.123456789), digits = digits)[1]
      txt <- paste0(prefix, txt)
      if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
      text(0.5, 0.5, txt, cex = cex.cor * r)
    }
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor)
    
    #plot 4
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor,
          lower.panel = panel.smooth)
    
    panel.lm <- function (x, y, col = par("col"), bg = NA, pch = par("pch"), 
                          cex = 1, col.line="red") {
      points(x, y, pch = pch, col = col, bg = bg, cex = cex)
      ok <- is.finite(x) & is.finite(y)
      if (any(ok)) {
        abline(lm(y[ok]~x[ok]), col = col.line)
      }
    }
    pairs(dados, diag.panel = panel.hist, upper.panel = panel.cor,
          lower.panel = panel.lm)
    
    #plot 5
    ggpairs(dados, lower = list(continuous = "smooth"))
    
    #plot 6
    ggpairs(correlacao, columns = 2:8, ggplot2::aes(colour=Especie))
    
    #plot 7
    corrgram(dados, 
             lower.panel = panel.pts, 
             upper.panel= panel.conf, 
             diag.panel = panel.density)
    