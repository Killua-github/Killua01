PMact2sleep <- function(PMMarray)
{
  x <- PMMarray
  n <- length(x[, 1, 1])
  PMsleep <- array(0, dim = c(n, 32, length(x[1, 1, ])))
  for (j in 1:length(x[1, 1, ])) {
    for (i in 1:(n - 4)) {
      a <- x[i:(i + 4), , j]
      b <- apply(a, 2, sum)
      for (h in 1:32) {
        PMsleep[i, h, j] <- PMsleep[i, h, j] + (b[h] == 0)
      }
    }
    PMsleep[(n - 3):n, , j] <- PMsleep[n - 4, , j]
  }
  dimnames(PMsleep) <- dimnames(x)
  return(PMsleep)
}
