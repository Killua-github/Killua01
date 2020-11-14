rbrAr <- function(temp1, temp2, temp3)
{
  library(readxl)
  data <- read_excel("yuna.xls")
  plot(data$"y=0.5(x)", data$"y=0.5(y)", pch = "-", type = "n",
       bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0, 730), ylim = c(0, 5))
  arrows(100, 0.5, 0, 0.5, col = "red")
  arrows(140, 0.5, 240, 0.5, col = "red")
  arrows(340, 0.5, 240, 0.5, col = "blue")
  arrows(380, 0.5, 480, 0.5, col = "blue")
  arrows(580, 0.5, 480, 0.5, col = "red")
  arrows(620, 0.5, 720, 0.5, col = "red")
  text(120, 0.5, temp1)
  text(360, 0.5, temp2)
  text(600, 0.5, temp3)
}
