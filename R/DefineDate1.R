DefineDate1 <- function(yy, mm, dd)
{
  MM <- Month(mm)
  date1 <- paste(dd, MM, yy)
  return(date1)
}
