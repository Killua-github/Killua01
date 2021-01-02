AMPMDAMsleep1 <- function(AMPM)
{
  AMPMMarray <- AMPMimportMarray(AMPM)
  AMPMsleep <- AMPMact2sleep(AMPMMarray)
  out <- AMPMDAMstat(AMPMMarray, AMPMsleep, AMPM)
  SaveAMPMstat(out)
}
