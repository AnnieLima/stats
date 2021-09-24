
#carregando dados
compressao <- read.table(
  "C:/Users/Annie de Lima/Downloads/Estatística/stat_debs/compressao.txt",
  header = T)
Especie <- compressao$especie
MOR <- compressao$MOR2
dados <- data.frame(Especie,MOR)

plt <- ggbetweenstats(
  data = dados,
  x = Especie,
  y = MOR
)
plt


plt <- plt + 
  # Add labels and title
  labs(
    x = "Espécies",
    y = "MOR (MPa)",
    title = "Distribuição de MOR por Espécie"
  ) + 
  # Customizations
  theme(
    # This is the new default font in the plot
    text = element_text(family = "Roboto", size = 8, color = "black"),
    plot.title = element_text(
      family = "Lobster Two", 
      size = 20,
      face = "bold",
      color = "#2a475e"
    ),
    # Statistical annotations below the main title
    plot.subtitle = element_text(
      family = "Roboto", 
      size = 15, 
      face = "bold",
      color="#1b2838"
    ),
    plot.title.position = "plot", # slightly different from default
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 12)
  )
plt


# 1. Remove axis ticks
# 2. Change default color of the axis lines with a lighter one
# 3. Remove most reference lines, only keep the major horizontal ones.
#    This reduces clutter, while keeping the reference for the variable
#    being compared.
# 4. Set the panel and the background fill to the same light color.

plt <- plt  +
  theme(
    axis.ticks = element_blank(),
    axis.line = element_line(colour = "grey50"),
    panel.grid = element_line(color = "#b4aea9"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(linetype = "dashed"),
    panel.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4"),
    plot.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4")
  )
plt


# Saving
ggsave(
  filename = "compressao-violinplot-with-ggstatsplot.png",
  plot = plt,
  width = 8,
  height = 8,
  device = "png"
)
