# COMPRESSÃO - 3

compressao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/compressao.txt",
  header = T)
names <- compressao$especie
value <- compressao$MOR2
data <- data.frame(names,value)

# Plot
data %>%
  ggplot( aes(x=names, y=value, fill=names)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE) +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Compressão") +
  ylab("MOR (MPa)") +  ylim(200,750) + xlab("Espécies")+coord_flip ()

# Plot better results
data %>%
  ggplot( aes(x=names, y=value, fill=names)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE) +
  geom_jitter(color="red", size=1.0, alpha=0.5) +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Compressão") +
  ylab("MOR (MPa)") + ylim(200,750) + xlab("Espécies")+coord_flip ()

# sample size
sample_size = data %>% group_by(names) %>% summarize(num=n())

# Plot
data %>%
  left_join(sample_size) %>%
  mutate(myaxis = paste0(names, "\n", "n=", num)) %>%
  ggplot( aes(x=myaxis, y=value, fill=names)) +
  geom_violin(width=1.4) +
  geom_boxplot(width=0.1, color="red", alpha=0.2) +
  scale_fill_viridis(discrete = TRUE) +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=12)
  ) +
  ggtitle("Compressão") +
  ylab("MOR (MPa)") + ylim(200,750)+ xlab("Espécies")


# Code coming from @drob: 
# https://gist.github.com/dgrtwo/eb7750e74997891d7c20#file-geom_flat_violin-r
"%||%" <- function(a, b) {
  if (!is.null(a)) a else b
}

geom_flat_violin <- function(mapping = NULL, data = NULL, stat = "ydensity",
                             position = "dodge", trim = TRUE, scale = "area",
                             show.legend = NA, inherit.aes = TRUE, ...) {
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomFlatViolin,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      trim = trim,
      scale = scale,
      ...
    )
  )
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomFlatViolin <-
  ggproto("GeomFlatViolin", Geom,
          setup_data = function(data, params) {
            data$width <- data$width %||%
              params$width %||% (resolution(data$x, FALSE) * 0.9)
            
            # ymin, ymax, xmin, and xmax define the bounding rectangle for each group
            data %>%
              group_by(group) %>%
              mutate(ymin = min(y),
                     ymax = max(y),
                     xmin = x,
                     xmax = x + width / 2)
            
          },
          
          draw_group = function(data, panel_scales, coord) {
            # Find the points for the line to go all the way around
            data <- transform(data, xminv = x,
                              xmaxv = x + violinwidth * (xmax - x))
            
            # Make sure it's sorted properly to draw the outline
            newdata <- rbind(plyr::arrange(transform(data, x = xminv), y),
                             plyr::arrange(transform(data, x = xmaxv), -y))
            
            # Close the polygon: set first and last point the same
            # Needed for coord_polar and such
            newdata <- rbind(newdata, newdata[1,])
            
            ggplot2:::ggname("geom_flat_violin", 
                             GeomPolygon$draw_panel
                             (newdata, panel_scales, coord))
          },
          
          draw_key = draw_key_polygon,
          
          default_aes = aes(weight = 1, 
                            colour = "grey20", 
                            fill = "white", size = 0.5,
                            alpha = NA, linetype = "solid"),
          
          required_aes = c("x", "y")
  )


# Final plot inspired from @jbburant: https://gist.github.com/jbburant/b3bd4961f3f5b03aeb542ed33a8fe062
data %>%
  sample_frac(0.4) %>%
  ggplot(aes(x = names, y = value, fill = names)) + 
  geom_flat_violin(scale = "count", trim = FALSE, width=2) + 
  scale_fill_viridis(discrete = TRUE) +
  stat_summary(fun.data = mean_sdl, 
               fun.args = list(mult = 1), 
               geom = "pointrange", 
               position = position_nudge(4.9)) + 
  geom_dotplot(binaxis = "y", 
               dotsize = 1.2, 
               stackdir = "down", 
               binwidth = 0.3, 
               position = position_nudge(-0.025)) + 
  theme_bw() +
  theme(
    legend.position = "none"
  ) + 
  ylab("MOR (MPa)")



# Ver: https://www.data-to-viz.com/caveat/boxplot.html para explicações

