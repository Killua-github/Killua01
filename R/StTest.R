StTest <- function(LD)
{
  library(readxl)
  summary <- read_excel("summary.xls")
  Summary <- as.matrix(summary)
  SCutfortTest(LD, summary)
  LDMarray <- SimportMarray(LD, summary)
  LDsleep <- Sact2sleep(LDMarray)
  LDstat <- SDAMstat(LDMarray, LDsleep, LD)
  SSavestat(LDstat, LD)
  for (i in 1:length(summary[,1]))
  {
    Length <- Summary[i, 2]:Summary[i, 3]
    if (is.na(summary[i, 5]))
    {
      Tstat <- LDstat[, Length, i]
    }
    else
    {
      exclude <- as.integer(unlist(strsplit(Summary[i, 5], ",")))
      length <- Length[- which(Length %in% exclude)]
      Tstat <- LDatat[, length, i]
    }
  }
  t.test(Tstat[1, , 1], Tstat[1, , 2], paired = T)
}
