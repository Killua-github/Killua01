kDAMsleep1 <- function(yy, MM, dd, hours, mins)
{
  DAMFileScan1(yy, MM, dd, hours, mins)
  library(flysleep)
  DAMsleep1()
}
