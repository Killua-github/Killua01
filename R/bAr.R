bAr <- function(temp1)
{
  library(readxl)
  data <- read_excel("yuna.xls")
  plot(data$"y=0.5(x)", data$"y=0.5(y)", pch = "-", type = "n",
       bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0, 730), ylim = c(0, 5))
  arrows(340, 0.5, 0, 0.5, col = "blue")
  arrows(380, 0.5, 720, 0.5, col = "blue")
  text(360, 0.5, temp1)
}
