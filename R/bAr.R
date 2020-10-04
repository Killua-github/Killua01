bAr <- function(temperature1)
{
  library(readxl)
  data <- read_excel("yuna.xls")
  plot(data$ "y=0.5(x)", data$ "y=0.5(y)", pch = "-", type = "n",
       bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0,14), ylim = c(0.4,1.4))
  arrows(6.5, 0.5, 1, 0.5, col = "blue")
  arrows(7.5, 0.5, 13, 0.5, col = "blue")
  text(7, 0.5, temperature1)
}
