StTestGraphSleep <- function(Tstat1, Tstat2, summary, LD)
{
  tdata1 <- Tstat1[4,]
  tdata2 <- Tstat2[4,]
  tData <- list(tdata1, tdata2)
  meandata <- lapply(tData, mean)
  sddata <- lapply(tData, sd)
  s1 <- as.character(summary[1, 4])
  s2 <- as.character(summary[2, 4])
  Data <- data.frame(summary = c(s1, s2),
                     mean = c(meandata[[1]][1], meandata[[2]][1]),
                     sd = c(sddata[[1]][1], sddata[[2]][1]))
  yRoof = (max(Data$mean) + max(Data$sd)) * 1.2
  pvalue <- t.test(tdata1, tdata2, var.equal = T)$p.value
  c.pvalue <- as.character(round(pvalue, digits = 4))
  d.pvalue <- paste("p", "=", c.pvalue)
  graph <- ggplot(data = Data, aes(x = summary, y = mean,
                                   fill = summary)) +
    geom_point(alpha = 0) +
    geom_bar(stat = "identity", width = 0.4) +
    xlab(names(summary[4])) +
    ylab("Sleep (hours per day)") +
    theme(legend.position = "none") +
    geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd,
                      width = 0.1)) +
    geom_signif(y_position = yRoof * 1.0, xmin = 1.0, xmax = 2.0,
                annotations = 
                  if (pvalue < 0.001)
                  {
                    "***"
                  }
                else if (pvalue < 0.01)
                {
                  "**"
                }
                else if (pvalue < 0.05)
                {
                  "*"
                }
                else
                {
                  "n.s."
                },
                tip_length = 0.05, textsize = 7) +
    annotate("text", x = 1.95, y = yRoof * 1.05, label = d.pvalue,
             fontface = "italic", size = 7)
  graph
  SAVEpng(paste0("sleep2tTestSleep_", LD, ".png"))
}
