SstatExclude1 <- function(LDstat, Summary)
{
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
  return(Tstat1)
}
