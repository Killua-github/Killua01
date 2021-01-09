StTest <- function(LD)
{
  library(readxl)
  library(data.table)
  library(ggplot2)
  library(ggsignif)
  summary <- read_excel("summary.xls")
  Summary <- as.matrix(summary)
  SDAMsleep1(LD, Summary)
  Tstat1 <- SstatExclude1(LDstat, Summary)
  Tstat2 <- SstatExclude2(LDstat, Summary)
  StTestGraphActive(Tstat1, Tstat2, summary, LD)
  StTestGraphSleep(Tstat1, Tstat2, summary, LD)
}
