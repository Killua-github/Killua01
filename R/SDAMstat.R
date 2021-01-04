SDAMstat <- function(LDMarray, LDsleep, LD)
{
  LDstat <- array(0, dim = c(11, 32, length(AMPMMarray[1, 1, ])))
  if (LD == "L")
  {
    rownames(LDstat) <- c("L total activity counts",
                       "L time active",
                       "L percent of time active",
                       "L amount of time resting",
                       "L waking activity index",
                       "L number of activity-rest bout",
                       "L mean length of activity period",
                       "L mean activity counts during one activity period",
                       "L maximum time of one activity period",
                       "L mean length of resting period",
                       "L maximum time of one resting period")
  }
  else if (LD == "D")
  {
    rownames(LDstat) <- c("D total activity counts",
                       "D time active",
                       "D percent of time active",
                       "D amount of time resting",
                       "D waking activity index",
                       "D number of activity-rest bout",
                       "D mean length of activity period",
                       "D mean activity counts during one activity period",
                       "D maximum time of one activity period",
                       "D mean length of resting period",
                       "D maximum time of one resting period")
  }
  for (i in 1:length(LDMarray[1, 1, ]))
  {
    LDstat[1, , i] <- apply(LDMarray[, , i], 2, sum)/3
    sleep <- apply(LDsleep[, , i], 2, sum)/3
    LDstat[4, , i] <- sleep/60
    LDstat[2, , i] <- (1440 - sleep)/60
    LDstat[3, , i] <- (1440 - sleep)/14.4
    LDstat[5, , i] <- LDstat[1, , i]/(1440 - sleep)
    z <- matrix(0, ncol = 32)
    bout1 <- rbind(z, LDsleep[, , i])
    bout2 <- rbind(LDsleep[, , i], z)
    bout3 <- bout1 - bout2
    bout4 <- bout3[2:(length(bout3[, 1]) - 1),]
    bout5 <- bout4 * bout4
    LDstat[6, , i] <- apply(bout5, 2, sum)/3/2
    LDstat[10, , i] <- sleep/LDstat[6, , i]
    LDstat[7, , i] <- (1440 - sleep)/LDstat[6, , i]
    LDstat[8, , i] <- LDstat[1, , i]/LDstat[6, , i]
    z <- (LDsleep - 1) * (LDsleep - 1)
    for (j in 1:length(LDsleep[1, , i]))
    {
      for (k in 2:length(AMPMsleep[, j, i]))
      {
        if (LDsleep[k, j, i] == 1)
        {
          LDsleep[k, j, i] <- LDsleep[k - 1, j, i] + 1
        }
        else
        {
          LDsleep[k, j, i] <- 0
        }
      }
    }
    LDstat[11, , i] <- apply(LDsleep[, , i], 2, max)
    for (j in 1:length(z[1, , i]))
    {
      for (k in 2:length(z[, j, i]))
      {
        if (z[k, j, i] == 1)
        {
          z[k, j, i] <- z[k - 1, j, i] + 1
        }
        else
        {
          z[k, j, i] <- 0
        }
      }
    }
    LDstat[9, , i] <- apply(z[, , i], 2, max)
  }
  return(LDstat)
}
