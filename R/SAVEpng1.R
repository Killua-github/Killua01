SAVEpng1 <- function(name)
{
  ggsave(file = ".png", dpi = 200, width = 15, height = 10)
  file.rename(".png", name)
}
