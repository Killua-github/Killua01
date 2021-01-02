AMPMDAMstat <- function(AMPMMarray, AMPMsleep, AMPM)
{
  out <- array(0, dim = c(11, 32, length(AMPMMarray[1, 1, ])))
  if (AMPM == "AM")
  {
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
  }
  else if (AMPM == "PM")
  {
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
  }
  for (j in 1:length(AMPMMarray[1, 1, ]))
  {
    out[1, , j] <- apply(AMPMMarray[, , j], 2, sum)/3
    sleep <- apply(AMPMsleep[, , j], 2, sum)/3
    out[4, , j] <- sleep/60
    out[2, , j] <- (1440 - sleep)/60
    out[3, , j] <- (1440 - sleep)/14.4
    out[5, , j] <- out[1, , j]/(1440 - sleep)
    z <- matrix(0, ncol = 32)
    bout1 <- rbind(z, AMPMsleep[, , j])
    bout2 <- rbind(AMPMsleep[, , j], z)
    bout3 <- bout1 - bout2
    bout4 <- bout3[2:(length(bout3[, 1]) - 1), ]
    bout5 <- bout4 * bout4
    out[6, , j] <- apply(bout5, 2, sum)/3/2
    out[10, , j] <- sleep/out[6, , j]
    out[7, , j] <- (1440 - sleep)/out[6, , j]
    out[8, , j] <- out[1, , j]/out[6, , j]
    z <- (AMPMsleep - 1) * (AMPMsleep - 1)
    for (m in 1:length(AMPMsleep[1, , j]))
    {
      for (n in 2:length(AMPMsleep[, m, j]))
      {
        if (AMPMsleep[n, m, j] == 1)
        {
          AMPMsleep[n, m, j] <- AMPMsleep[n - 1, m, j] + 1
        }
        else
        {
          AMPMsleep[n, m, j] <- 0
        }
      }
    }
    out[11, , j] <- apply(AMPMsleep[, , j], 2, max)
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
  return(out)
}
