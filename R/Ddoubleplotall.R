Ddoubleplotall <- function(Marray)
{
  for(j in 1:length(Marray[1, 1, ]))
  {
    fileName <- unlist(dimnames(Marray)[3])[j]
    row <- length(Marray[, 1, 1]) / 1440 - 1
    pdf(paste0(fileName, "_doubleplot", ".pdf"), width=11, height=8)
    par(oma = c(0, 0, 2, 0))
    par(mfcol = c(row, 8))
    par(mai = c(0.03, 0.05, 0.1, 0))
    for (i in 1:length(Marray[1, , j]))
    {
      title <- sprintf("Channel_%d", i)
      a <- Marray[1:2880, i, j]
      barplot(a, main = title, axes = FALSE, xlab = NA, ylab = NA)
      for (k in 2:(length(Marray[, i, j]) / 1440 - 1))
      {
        b <- Marray[((k - 1) * 1440 + 1):((k + 1) * 1440), i, j]
        barplot(b, axes=FALSE, xlab = NA, ylab = NA)
      }
      mtext(side = 3, line = 0, outer = T, text = fileName, cex = 1.5)
    }
    dev.off()
  }
}
