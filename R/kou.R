kou <- function(light, colour, temp1, temp2, temp3)
{
  if(light == "LD")
  {
    if(colour == "B")
    {
      png(file = paste(light, "_", colour, "_",
                       temp1, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "R")
    {
      png(file = paste(light, "_", colour, "_",
                       temp1, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "BRB")
    {
      png(file = paste(light, "_", colour, "_",
                       temp1, temp2, temp3, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "RBR")
    {
      png(file = paste(light, "_", colour, "_",
                       temp1, temp2, temp3, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else
    {
      noquote("error colour argument")
    }
  }
  else if(light == "DD")
  {
    if(colour == "B")
    {
      png(file = paste(light, colour, temp1, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "R")
    {
      png(file = paste(light, colour, temp1, ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "BRB")
    {
      png(file = paste(light, colour, temp1, temp2, temp3,
                       ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else if(colour == "RBR")
    {
      png(file = paste(light, colour, temp1, temp2, temp3,
                       ".png", sep = ""),
          width = 1000, height = 400)
      COWorRAT(light)
      par(new = T)
      arrow(colour, temp1, temp2, temp3)
      dev.off()
    }
    else
    {
      noquote("error colour argument")
    }
  }
  else
  {
    noquote("error light argument")
  }
}
