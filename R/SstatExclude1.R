SstatExclude1 <- function(LDstat, Outline)
{
  Length1 <- Outline[1, 2]:Outline[1, 3]
  tstat1 <- LDstat[, Length1, 1]
  if (is.na(Outline[1, 5]))
  {
    Tstat1 <- tstat1
  }
  else
  {
    exclude <- as.integer(unlist(strsplit(Outline[1, 5], ",")))
    Exclude <- exclude - as.numeric(Outline[1, 2]) + 1
    Tstat1 <- tstat1[, -Exclude]
  }
  return(Tstat1)
}
