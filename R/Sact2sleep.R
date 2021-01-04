Sact2sleep <- function(LDMarray)
{
  n <- length(LDMarray[, 1, 1])
  LDsleep <- array(0, dim = c(n, 32, length(LDMarray[1, 1, ])))
  for (i in 1:length(LDMarray[1, 1, ]))
  {
    for (j in 1:(n - 4))
    {
      a <- LDMarray[j:(j + 4), , i]
      b <- apply(a, 2, sum)
      for (k in 1:32)
      {
        LDsleep[j, k, i] <- LDsleep[j, k, i] + (b[k] == 0)
      }
    }
    LDsleep[(n - 3):n, , i] <- LDsleep[n - 4, , i]
  }
  dimnames(LDsleep) <- dimnames(LDMarray)
  return(LDsleep)
}
