SAVEpng2 <- function(name)
{
  ggsave(file = ".png", dpi = 200, width = 7, height = 6.99)
  file.rename(".png", name)
}
