rbrAr <- function(temperature1, temperature2, temperature3)
{
  plot(data$ "y=0.5(x)", data$ "y=0.5(y)", pch = "-", type = "n",
       bty = "n", ann = "F", xaxt = "n", yaxt = "n",
       xlim = c(0,14), ylim = c(0.4,1.4))
  arrows(2.5, 0.5, 1, 0.5, col = "red")
  arrows(3.5, 0.5, 5, 0.5, col = "red")
  arrows(6.5, 0.5, 5, 0.5, col = "blue")
  arrows(7.5, 0.5, 9, 0.5, col = "blue")
  arrows(10.5, 0.5, 9, 0.5, col ="red")
  arrows(11.5, 0.5, 13, 0.5, col = "red")
  text(3, 0.5, temperature1)
  text(7, 0.5, temperature2)
  text(11, 0.5, temperature3)
}
