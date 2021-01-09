SstatExclude2 <- function(LDstat, Outline)
{
  Length2 <- Outline[2, 2]:Outline[2, 3]
  tstat2 <- LDstat[, Length2, 2]
  if (is.na(Outline[2, 5]))
  {
    Tstat2 <- tstat2
  }
  else
  {
    exclude <- as.integer(unlist(strsplit(Outline[2, 5], ",")))
    Exclude <- exclude - as.numeric(Outline[2, 2]) + 1
    Tstat2 <- tstat2[, -Exclude]
  }
  return(Tstat2)
}
