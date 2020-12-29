PMDAMstat <- function(PMMarray, PMsleep)
{
  out <- array(0, dim = c(11, 32, length(PMMarray[1, 1, ])))
  rownames(out) <- c("PM total activity counts",
                     "PM time active",
                     "PM percent of time active",
                     "PM amount of time resting",
                     "PM waking activity index",
                     "PM number of activity-rest bout",
                     "PM mean length of activity period",
                     "PM mean activity counts during one activity period",
                     "PM maximum time of one activity period",
                     "PM mean length of resting period",
                     "PM maximum time of one resting period")
  for (i in 1:length(PMMarray[1, 1, ]))
  {
    out[1, , i] <- apply(PMMarray[, , i], 2, sum)/3
    sleep <- apply(PMsleep[, , i], 2, sum)/3
    out[2, , i] <- (1440 - sleep)/60
    out[3, , i] <- (1440 - sleep)/14.4
    out[4, , i] <- sleep/60
    out[5, , i] <- out[1, , i]/(1440 - sleep)
    z <- matrix(0, ncol = 32)
    bout1 <- rbind(z, PMsleep[, , i])
    bout2 <- rbind(PMsleep[, , i], z)
    bout3 <- bout1 - bout2
    bout4 <- bout3[2:(length(bout3[, 1]) - 1),]
    bout5 <- bout4 * bout4
    out[6, , i] <- apply(bout5, 2, sum)/3/2
    out[7, , i] <- (1440 - sleep)/out[6, , i]
    out[8, , i] <- out[1, , i]/out[6, , i]
    out[10, , i] <- sleep/out[6, , i]
    z <- (PMsleep - 1) * (PMsleep - 1)
    for (j in 1:length(PMsleep[1, , i]))
    {
      for (k in 2:length(PMsleep[, j, i]))
      {
        if (PMsleep[k, j, i] == 1)
        {
          PMsleep[k, j, i] <- PMsleep[k - 1, j, i] + 1
        }
        else
        {
          PMsleep[k, j, i] <- 0
        }
      }
    }
    out[11, , i] <- apply(PMsleep[, , i], 2, max)
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
                        dimnames(PMMarray)[[3]])
  b <- matrix(rep(paste("C", c(1:32), sep = "")), 
              ncol = 32)
  row.names(b) <- dimnames(out)[[3]][1]
  PMstat <- out[, , 1]
  PMstat <- rbind(b, PMstat)
  for (i in 2:length(out[1, 1, ])) {
    row.names(b) <- dimnames(out)[[3]][i]
    PMstat <- rbind(PMstat, b, out[, , i])
  }
  return(PMstat)
}
