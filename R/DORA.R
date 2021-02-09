DORA <- function(pon, acmean1, acmean2, slmean1, slmean2)
{
  list <- list(acmean1, acmean2, slmean1, slmean2)
  mean <- lapply(list, mean)
  sd <- lapply(list, sd)
  dora <- data.frame(summary = c(as.character(pon[1, 4]),
                                 as.character(pon[2, 4])),
                     ActiveMean = c(mean[[1]][1], mean[[2]][1]),
                     ActiveSd = c(sd[[1]][1], sd[[2]][1]),
                     SleepMean = c(mean[[3]][1], mean[[4]][1]),
                     SleepSd = c(sd[[3]][1], sd[[4]][1]))
  return(dora)
}
