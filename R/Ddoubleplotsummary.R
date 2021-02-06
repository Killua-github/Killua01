Ddoubleplotsummary <- function(Marray, outline, Outline)
{
  mean <- matrix(NA, ncol = length(Outline[, 1]),
                 nrow = length(Marray[, 1, 1]))
  for(i in 1:length(Outline[, 1]))
  {
    Length <- as.numeric(Outline[i, 2]):as.numeric(Outline[i, 3])
    array <- Marray[, Length, Outline[i, 1]]
    if(is.na(Outline[i, 5]))
    {
      Array <- array
    }
    else
    {
      exclude <- as.integer(unlist(strsplit(Outline[i, 5], ",")))
      Exclude <- exclude - as.numeric(Outline[1, 2]) + 1
      Array <- array[, -Exclude]
    }
    mean[, i] <- apply(Array, 1, mean)
  }
  colnames(mean) <- Outline[, 4]
  column <- length(mean[1, ])
  row <- length(mean[, 1]) / 1440 - 1
  pdf(paste0("doubleplot_summary", ".pdf"), width = 11, height = 8)
  par(oma = c(0, 0, 2, 0))
  par(mfcol = c(row, column))
  par(mai = c(0.03, 0.05, 0.1, 0))
  for (i in 1:length(mean[1, ]))
  {
    title <- colnames(mean)[i]
    a <- mean[1:2880, i]
    barplot(a, main = title, axes = FALSE, xlab = NA, ylab = NA)
    for (k in 2:(length(Marray[, 1, 1]) / 1440 - 1))
    {
      b <- mean[((k - 1) * 1440 + 1):((k + 1) * 1440), i]
      barplot(b, axes = FALSE, xlab = NA, ylab = NA)
    }
  }
  mtext(side = 3, line = 0, outer = T, text = names(outline[4]), cex = 1.5)
  dev.off()
}
