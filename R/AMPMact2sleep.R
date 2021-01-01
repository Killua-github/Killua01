AMPMact2sleep <- function(AMPMMarray)
{
  n <- length(AMPMMarray[, 1, 1])
  AMPMsleep <- array(0, dim = c(n, 32, length(AMPMMarray[1, 1, ])))
  for (j in 1:length(AMPMMarray[1, 1, ])) {
    for (i in 1:(n - 4)) {
      a <- AMPMMarray[i:(i + 4), , j]
      b <- apply(a, 2, sum)
      for (h in 1:32) {
        AMPMsleep[i, h, j] <- AMPMsleep[i, h, j] + (b[h] == 0)
      }
    }
    AMPMsleep[(n - 3):n, , j] <- AMPMsleep[n - 4, , j]
  }
  dimnames(AMPMsleep) <- dimnames(AMPMMarray)
  return(AMPMsleep)
}
