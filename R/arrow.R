arrow <- function(colour, temp1, temp2, temp3)
{
  if(colour == "R")
  {
    rAr(temp1)
  }
  else if (colour == "B")
  {
    bAr(temp1)
  }
  else if (colour == "RBR")
  {
    rbrAr(temp1, temp2, temp3)
  }
  else if (colour == "BRB")
  {
    brbAr(temp1, temp2, temp3)
  }
  else
  {
    noquote("error colour argument")
  }
}
