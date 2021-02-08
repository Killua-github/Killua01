SAVEpdf1 <- function(name)
{
  ggsave(file = ".pdf", width = 10.51, height = 5.44)
  file.rename(".pdf", name)
}
