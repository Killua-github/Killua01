arrow <- function(colour, temperature1, temperature2, temperature3)
{
  i <- colour
  if(i == "R")
  {
    rAr(temperature1)
  }
  else if (i == "B")
  {
    bAr(temperature1)
  }
  else if (i == "RBR")
  {
    rbrAr(temperature1, temperature2, temperature3)
  }
  else if (i == "BRB")
  {
    brbAr(temperature1, temperature2, temperature3)
  }
  else
  {
    print("error arguments")
  }
}
