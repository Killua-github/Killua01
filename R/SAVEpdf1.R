SAVEpdf <- function(name)
{
  library(ggplot2)
  ggsave(file = ".pdf", width = 10.51, height = 5.44)
  file.rename(".pdf", name)
}
