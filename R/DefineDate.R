DefineDate <- function(yy, mm, dd, j)
{
  for (i in 1:j)
  {
    dd <- dd + 1
    if (dd == 32)
    {
      mm <- mm + 1
      dd <- 01
    }
    else if (dd == 31)
    {
      if (mm == 04)
      {
        mm <- mm + 1
        dd <- 01
      }
      else if (mm == 06)
      {
        mm <- mm + 1
        dd <- 01
      }
      else if (mm == 09)
      {
        mm <- mm + 1
        dd <- 01
      }
      else if (mm == 11)
      {
        mm <- mm + 1
        dd <- 01
      }
    }
    if (mm == 02)
    {
      if (dd == 30)
      {
        mm <- 03
        dd <- 01
      }
      else if (dd == 29)
      {
        y <- yy %% 4
        if (y == 0)
        {
          mm <- 02
          dd <- 29
        }
        else
        {
          mm <- 03
          dd <- 01
        }
      }
    }
    else if (mm == 13)
    {
      yy <- yy + 1
      mm <- 01
      dd <- 01
    }
  }
  MM <- Month(mm)
  date <- paste(dd, MM, yy)
  return(date)
}
