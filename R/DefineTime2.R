DefineTime2 <- function(time1, days)
{
  time2 <- time1 - 1 + (days * 24 * 60)
  return(time2)
}
