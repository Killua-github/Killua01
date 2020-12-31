AMact2sleep <- function(AMMarray) 
{
  x <- AMMarray
  n <- length(x[, 1, 1])
  AMsleep <- array(0, dim = c(n, 32, length(x[1, 1, ])))
  for (j in 1:length(x[1, 1, ])) {
    for (i in 1:(n - 4)) {
      a <- x[i:(i + 4), , j]
      b <- apply(a, 2, sum)
      for (h in 1:32) {
        AMsleep[i, h, j] <- AMsleep[i, h, j] + (b[h] == 0)
      }
    }
    AMsleep[(n - 3):n, , j] <- AMsleep[n - 4, , j]
  }
  dimnames(AMsleep) <- dimnames(x)
  return(AMsleep)
}
