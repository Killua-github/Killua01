AMPMDAMsleep1 <- function(AMPM)
{
  AMPMMarray <- AMPMimportMarray(AMPM)
  AMPMsleep <- AMPMact2sleep(AMPMMarray)
  AMPMstat <- AMPMDAMstat(AMPMMarray, AMPMsleep, AMPM)
  write.table(AMPMstat, paste("stat", AMPM, ".txt"),
              col.names = FALSE, row.names = TRUE,sep = "\t", quote = FALSE)
  return(AMPMstat)
}
