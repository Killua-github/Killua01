RAT <- function()
{
  plot(data$"y=1.2(x)", data$"y=1.2(y)", pch = "-", type = "l",
       bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0, 730), ylim = c(0, 5))
  points(data$"y=1(x)", data$"y=1(y)", pch = "-", type = "l")
  points(data$"x=0", data$"y", pch = "・", type = "l")
  points(data$"x=12", data$"y", pch = "・", type = "l")
  points(data$"x=24", data$"y", pch = "・", type = "l")
  points(data$"x=36", data$"y", pch = "・", type = "l")
  points(data$"x=48", data$"y", pch = "・", type = "l")
  points(data$"x=60", data$"y", pch = "・", type = "l")
  points(data$"x=72", data$"y", pch = "・", type = "l")
  polygon(data$grX1, data$colorY, col = "gray")
  polygon(data$grX2, data$colorY, col = "gray")
  polygon(data$grX3, data$colorY, col = "gray")
  polygon(data$black1, data$colorY, col = "black")
  polygon(data$black2, data$colorY, col = "black")
  polygon(data$black3, data$colorY, col = "black")
}
