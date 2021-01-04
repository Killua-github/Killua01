DefineDate1 <- function(yy, mm, dd)
{
  MM <- Month(mm)
  date1 <- paste(dd, MM, yy, sep = " ")
  return(date1)
}
