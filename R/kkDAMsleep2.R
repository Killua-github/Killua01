kkDAMsleep2 <- function (hrs) 
{
  library(readxl)
  summary <- read_excel("summary.xls")
  out <- meanSEM(hrs, summary)
  library(ggplot2)
  p <- ggplot(out, aes_string(x = "time", y = "mean", group = names(out)[2],
                              colour = names(out)[2])) + 
    geom_line() + ylab("sleep (min/hr)") + ylim(0, 60)
  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p
}
