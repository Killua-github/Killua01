StTestGraphActive <- function(Tstat1, Tstat2, outline, LD)
{
  tdata1 <- Tstat1[1, ]
  tdata2 <- Tstat2[1, ]
  tData <- list(tdata1, tdata2)
  meandata <- lapply(tData, mean)
  sddata <- lapply(tData, sd)
  s1 <- as.character(outline[1, 4])
  s2 <- as.character(outline[2, 4])
  Data <- data.frame(outline = c(s1, s2),
                     mean = c(meandata[[1]][1], meandata[[2]][1]),
                     sd = c(sddata[[1]][1], sddata[[2]][1]))
  yRoof = (max(Data$mean) + max(Data$sd)) * 1.2
  pvalue <- t.test(tdata1, tdata2, var.equal = T)$p.value
  c.pvalue <- as.character(sprintf("%0.4e", pvalue))
  d.pvalue <- paste("p", "=", c.pvalue)
  graph <- ggplot(data = Data, aes(x = outline, y = mean,
                                   fill = outline)) +
           geom_point(alpha = 0) +
           geom_bar(stat = "identity", width = 0.4) +
           xlab(names(outline[4])) +
           ylab("Activity Counts (counts per day)") +
           theme(legend.position = "none",
                 axis.title=element_text(size = 15),
                 axis.text=element_text(size = 12)) +
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
           annotate("text", x = 2.125, y = yRoof * 1.05, label = d.pvalue,
                    fontface = "italic", size = 5)
  graph
  SAVEpng2(paste0("sleep2tTestActive_", LD, ".png"))
}
