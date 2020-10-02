SAVEpng <- function(name)
{
  library(ggplot2)
  ggsave(file = ".png", dpi = 200, width = 15, height = 10)
  file.rename(".png", name)
}
