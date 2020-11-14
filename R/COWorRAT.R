COWorRAT <- function(light)
{
  if(light == "LD")
  {
    COW()
  }
  else if(light == "DD")
  {
    RAT()
  }
  else
  {
    noquote("error light argument")
  }
}
