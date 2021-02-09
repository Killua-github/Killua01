TYUN <- function(dora, slmean1, slmean2)
{
  ron <- t.test(slmean1, slmean2, ver.equal = T)$p.value
  tumo <- paste("P =", as.character(ron))
  yRoof = (max(dora$SleepMean) + max(dora$SleepSd)) * 1.2
  haku <- ggplot(dora, aes(x = summary, y = SleepMean, fill = summary)) +
          geom_bar(stat = "identity", position = "dodge", width = 0.5) +
          labs(x = "genotype", y = "Sleep Amount (hours per day)") +
          theme(legend.position = "none") +
          geom_errorbar(aes(ymax = SleepMean + SleepSd,
                            ymin = SleepMean - SleepSd),
                        position = position_dodge(0.9), width = 0.1) +
          geom_signif(y_position = yRoof * 1.1, xmin = 1.0, xmax = 2.0,
                      annotations =
                        if (ron < 0.001)
                        {
                          "***"
                        }
                        else if (ron < 0.01)
                        {
                          "**"
                        }
                        else if (ron < 0.05)
                        {
                          "*"
                        }
                        else
                        {
                          "n.s."
                        }
                      ) +
          annotate("text", x = 1.95, y = yRoof * 1.15, label = tumo,
                   fontface = "italic", size = 3)
  ggsave(file ="AmountSleep.png", dpi = 200, width = 15, height = 10)
}
