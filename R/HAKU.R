HATU <- function(dora, acmean1, acmean2)
{
  ron <- t.test(acmean1, acmean2, ver.equal = T)$p.value
  pin <- paste("P =", as.character(ron))
  yRoof = (max(dora$ActiveMean) + max(dora$ActiveSd)) * 1.2
  haku <- ggplot(dora, aes(x = summary, y = ActiveMean, fill = summary)) +
          geom_bar(stat = "identity", position = "dodge", width = 0.5) +
          labs(x = "genotype", y = "Activity Counts (counts per day)") +
          theme(legend.position = "none") +
          geom_errorbar(aes(ymax = ActiveMean + ActiveSd,
                            ymin = ActiveMean - ActiveSd),
                        position = position_dodge(0.9), width = 0.1) +
          geom_signif(y_position = yRoof * 1.0, xmin = 1.0, xmax = 2.0,
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
          annotate("text", x = 1.95, y = yRoof * 1.05, label = pin,
                   fontface = "italic", size = 3)
  ggsave(file = "ActiveCounts.png", dpi = 200, width = 15, height = 10)
}
