kDAMsleep1 <- function(yy, MM, dd, hours, mins)
{
  DAMFileScan(yy, MM, dd, hours, mins)
  library(flysleep)
  x <- DAMsleep1()
}
