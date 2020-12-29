PMDAMsleep1 <- function()
{
  PMMarray <- PMimportMarray()
  PMsleep <- act2sleep(PMMarray)
  PMstat <- PMDAMstat(PMMarray, PMsleep)
  write.table(PMstat, "statPM.txt", col.names = FALSE, row.names = TRUE,
              sep = "\t", quote = FALSE)
}
