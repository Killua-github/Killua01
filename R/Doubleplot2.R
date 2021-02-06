Doubleplot2 <- function(Marray)
{
  library(readxl)
  outline <- read_excel("summary.xls")
  Outline <- as.matrix(outline)
  Ddoubleplotsummary(Marray, outline, Outline)
  
}
