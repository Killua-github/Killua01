AMDAMsleep1 <- function()
{
  AMMarray <- AMimportMarray()
  AMsleep <- act2sleep(AMMarray)
  AMstat <- AMDAMstat(AMMarray, AMsleep)
  write.table(AMstat, "statAM.txt", col.names = FALSE, row.names = TRUE,
              sep = "\t", quote = FALSE)
  return(AMstat)
}
