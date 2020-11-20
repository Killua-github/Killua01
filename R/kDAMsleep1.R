kDAMsleep1 <- function(yy, MM, dd, hours, mins)
{
  DAMFileScan(yy, MM, dd, hours, mins)
  library(flysleep)
  DAMsleep1()
  return(x)
}
