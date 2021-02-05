Doubleplot1 <- function()
{
  Marray <- DimportMarray2()
  barplotall(Marray)
  Ddoubleplotall(Marray)
  sleep <- act2sleep(Marray)
  stat <- DDAMstat(Marray, sleep)
  write.table(stat, "stat.txt", col.names = FALSE, row.names = TRUE, 
              sep = "\t", quote = FALSE)
  return(Marray)
}
