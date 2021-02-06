DDAMstat <- function (Marray, sleep)
{
  out <- array(0, dim = c(11, 32, length(Marray[1, 1, ])))
  days <- length(Marray[, 1, 1]) / 1440
  rownames(out) <- c("total acitivy counts",
                     "time active",
                     "percent of time active",
                     "amount of time resting",
                     "waking activity index",
                     "number of activity-rest bout",
                     "mean length of activity period",
                     "mean activity counts during one activity period",
                     "maximum time of one activity period",
                     "mean length of resting period",
                     "maximum time of one resting period")
  for (j in 1:length(Marray[1, 1, ]))
  {
    out[1, , j] <- apply(Marray[, , j], 2, sum) / days
    Sleep <- apply(sleep[, , j], 2, sum) / days
    out[4, , j] <- Sleep / 60
    out[2, , j] <- (1440 - Sleep) / 60
    out[3, , j] <- (1440 - Sleep) / 14.4
    out[5, , j] <- out[1, , j] / (1440 - Sleep)
    z <- matrix(0, ncol = 32)
    bout1 <- rbind(z, sleep[, , j])
    bout2 <- rbind(sleep[, , j], z)
    bout3 <- bout1 - bout2
    bout4 <- bout3[2:(length(bout3[, 1]) - 1), ]
    bout5 <- bout4 * bout4
    out[6, , j] <- apply(bout5, 2, sum) / days / 2
    out[10, , j] <- Sleep / out[6, , j]
    out[7, , j] <- (1440 - Sleep) / out[6, , j]
    out[8, , j] <- out[1, , j] / out[6, , j]
    z <- (sleep - 1) * (sleep - 1)
    for (m in 1:length(sleep[1, , j]))
    {
      for (n in 2:length(sleep[, m, j]))
      {
        if (sleep[n, m, j] == 1)
        {
          sleep[n, m, j] <- sleep[n - 1, m, j] + 1
        }
        else
        {
          sleep[n, m, j] <- 0
        }
      }
    }
    out[11, , j] <- apply(sleep[, , j], 2, max)
    for (m in 1:length(z[1, , j]))
    {
      for (n in 2:length(z[, m, j]))
      {
        if (z[n, m, j] == 1)
        {
          z[n, m, j] <- z[n - 1, m, j] + 1
        }
        else
        {
          z[n, m, j] <- 0
        }
      }
    }
    out[9, , j] <- apply(z[, , j], 2, max)
  }
  dimnames(out) <- list(rownames(out), colnames(out),
                        dimnames(Marray)[[3]])
  b <- matrix(rep(paste0("C", c(1:32))), ncol = 32)
  row.names(b) <- dimnames(out)[[3]][1]
  stat <- out[, , 1]
  stat <- rbind(b, stat)
  for (i in 2:length(out[1, 1, ]))
  {
    row.names(b) <- dimnames(out)[[3]][i]
    stat <- rbind(stat, b, out[, , i])
  }
  return(stat)
}
