SAVEpdf2 <- function(name)
{
  ggsave(file = ".pdf", width = 7.00, height = 6.99)
  file.rename(".pdf", name)
}
