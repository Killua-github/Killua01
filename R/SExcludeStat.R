ExcludeStat <- function(LDstat, Summary)
{
  tstat <- array(0, dim = c(11, 32, length(Summary[, 1])))
  for (i in 1:length(Summary[, 1]))
  {
    Length <- Summary[i, 2]:Summary[i, 3]
    tstat[, Length, i] <- LDstat[, Length, i]
    if (is.na(Summary[i, 5]))
    {
      Tstat <- tstat
    }
    else
    {
      exclude <- as.integer(unlist(strsplit(Summary[i, 5], ",")))
      Tstat <- tstat[, -exclude, i]
    }
  }
  return(Tstat)
}
