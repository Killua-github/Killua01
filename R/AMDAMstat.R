AMDAMstat <- function(AMMarray, AMsleep)
{
  out <- array(0, dim = c(11, 32, length(AMMarray[1, 1, ])))
  rownames(out) <- c("AM total activity counts",
                     "AM time active",
                     "AM percent of time active",
                     "AM amount of time resting",
                     "AM waking activity index",
                     "AM number of activity-rest bout",
                     "AM mean length of activity period",
                     "AM mean activity counts during one activity period",
                     "AM maximum time of one activity period",
                     "AM mean length of resting period",
                     "AM maximum time of one resting period")
  for (i in 1:length(AMMarray[1, 1, ]))
  {
    out[1, , i] <- apply(AMMarray[, , i], 2, sum)/3
    sleep <- apply(AMsleep[, , i], 2, sum)/3
    out[2, , i] <- (1440 - sleep)/60
    out[3, , i] <- (1440 - sleep)/14.4
    out[4, , i] <- sleep/60
    out[5, , i] <- out[1, , i]/(1440 - sleep)
    z <- matrix(0, ncol = 32)
    bout1 <- rbind(z, AMsleep[, , i])
    bout2 <- rbind(AMsleep[, , i], z)
    bout3 <- bout1 - bout2
    bout4 <- bout3[2:(length(bout3[, 1]) - 1),]
    bout5 <- bout4 * bout4
    out[6, , i] <- apply(bout5, 2, sum)/3/2
    out[7, , i] <- (1440 - sleep)/out[6, , i]
    out[8, , i] <- out[1, , i]/out[6, , i]
    out[10, , i] <- sleep/out[6, , i]
    z <- (AMsleep - 1) * (AMsleep - 1)
    for (j in 1:length(AMsleep[1, , i]))
    {
      for (k in 2:length(AMsleep[, j, i]))
      {
        if (AMsleep[k, j, i] == 1)
        {
          AMsleep[k, j, i] <- AMsleep[k - 1, j, i] + 1
        }
        else
        {
          AMsleep[k, j, i] <- 0
        }
      }
    }
    out[11, , i] <- apply(AMsleep[, , i], 2, max)
    for (j in 1:length(z[1, , i]))
    {
      for (k in 2:length(z[, j, i]))
      {
        if (z[k, j, i] == 1)
        {
          z[k, j, i] <- z[n - 1, j, i] + 1
        }
        else
        {
          z[k, j, i] <- 0
        }
      }
    }
    out[9, , i] <- apply(z[, , i], 2, max)
  }
  dimnames(out) <- list(rownames(out), colnames(out),
                        dimnames(AMMarray)[[3]])
  b <- matrix(rep(paste("C", c(1:32), sep = "")), 
              ncol = 32)
  row.names(b) <- dimnames(out)[[3]][1]
  AMstat <- out[, , 1]
  AMstat <- rbind(b, AMstat)
  for (i in 2:length(out[1, 1, ])) {
    row.names(b) <- dimnames(out)[[3]][i]
    AMstat <- rbind(AMstat, b, out[, , i])
  }
  return(AMstat)
}
