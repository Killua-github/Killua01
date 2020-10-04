RAT <- function()
{
  plot(data$"y = 1.2(x)", data$"y = 1.2(y)", pch = "-",
       type = "l", bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0,14), ylim = c(0.4,1.4))
  points(data$"y = 1(x)", data$"y = 1(y)", pch = "-", type = "l")
  points(data$"y = 0.5(x)", data$"y = 0.5(y)", pch = "-", type = "n")
  points(data$"x = 1", data$"y", pch = "・", type = "l")
  points(data$"x = 3", data$"y", pch = "・", type = "l")
  points(data$"x = 5", data$"y", pch = "・", type = "l")
  points(data$"x = 7", data$"y", pch = "・", type = "l")
  points(data$"x = 9", data$"y", pch = "・", type = "l")
  points(data$"x = 11", data$"y", pch = "・", type = "l")
  points(data$"x = 13", data$"y", pch = "・", type = "l")
  polygon(data$grX1, data$colorY, col = "gray")
  polygon(data$grX2, data$colorY, col = "gray")
  polygon(data$grX3, data$colorY, col = "gray")
  polygon(data$black1, data$colorY, col = "black")
  polygon(data$black2, data$colorY, col = "black")
  polygon(data$black3, data$colorY, col = "black")
}
