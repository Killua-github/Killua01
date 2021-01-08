SstatExclude2 <- function(LDstat, Summary)
{
  Length2 <- Summary[2, 2]:Summary[2, 3]
  tstat2 <- LDstat[, Length2, 2]
  if (is.na(Summary[2, 5]))
  {
    Tstat2 <- tstat2
  }
  else
  {
    exclude <- as.integer(unlist(strsplit(Summary[2, 5], ",")))
    Exclude <- exclude - as.numeric(Summary[2, 2]) + 1
    Tstat2 <- tstat2[, -Exclude]
  }
  return(Tstat2)
}
