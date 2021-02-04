kDAMsleep1 <- function(yy, mm, dd, hours, mins, days)
{
  library(flysleep)
  days <- 3
  DAMFileScan(yy, mm, dd, hours, mins, days)
  DAMsleep1()
}
