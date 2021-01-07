StTest <- function(LD)
{
  library(readxl)
  summary <- read_excel("summary.xls")
  Summary <- as.matrix(summary)
  SCutfortTest(LD, Summary)
  LDMarray <- SimportMarray(LD, Summary)
  LDsleep <- Sact2sleep(LDMarray)
  LDstat <- SDAMstat(LDMarray, LDsleep, LD)
  SSavestat(LDstat, Summary, LD)
  Length1 <- Summary[1, 2]:Summary[1, 3]
  tstat1 <- LDstat[, Length1, 1]
  if (is.na(Summary[1, 5]))
  {
    Tstat1 <- tstat1
  }
  else
  {
    exclude <- as.integer(unlist(strsplit(Summary[1, 5], ",")))
    Exclude <- exclude - as.numeric(Summary[1, 2]) + 1
    Tstat1 <- tstat1[, -Exclude]
  }
  Length2 <- Summary[2, 2]:Summary[2, 3]
  tstat2 <- LDstat[, Length2, 2]
  if (is.na(Summary[2, 5]) == TRUE)
  {
    Tstat2 <- tstat2
  }
  else
  {
    exclude <- as.integer(unlist(strsplit(Summary[2, 5], ",")))
    Exclude <- exclude - as.numeric(Summary[2, 2]) + 1
    Tstat2 <- tstat2[, -Exclude]
  }
  t.test(Tstat1[1,], Tstat2[1,])
}
