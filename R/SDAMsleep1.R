SDAMsleep1 <- function(LD, Summary)
{
  SCutfortTest(LD, Summary)
  LDMarray <- SimportMarray(LD, Summary)
  LDsleep <- Sact2sleep(LDMarray)
  LDstat <- SDAMstat(LDMarray, LDsleep, LD)
  SSavestat(LDstat, Summary, LD)
}