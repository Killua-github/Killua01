KEN <- function()
{
  library(readxl)
  library(data.table)
  library(ggplot2)
  library(ggsignif)
  pon <- read_excel("summary.xls")
  stat <- fread("stat.txt")
  stat1 <- stat[1:11, 2:33]
  stat2 <- stat[13:23, 2:33]
  acmean1 <- as.numeric(stat1[1, ])
  acmean2 <- as.numeric(stat2[1, ])
  slmean1 <- as.numeric(stat1[4, ])
  slmean2 <- as.numeric(stat2[4, ])
  dora <- DORA(pon, acmean1, acmean2, slmean1, slmean2)
  HATU(dora, acmean1, acmean2)
  TYUN(dora, slmean1, slmean2)
}
