SimportMarray <- function(LD, summary)
{
  LDMarray <- array(0, dim = c(720 * 3, 32, length(summary[,1])))
  for (i in 1:length(summary[,1]))
  {
    LDfile <- list.files(paste(summary[i, 1], LD, ".txt", sep = ""))
    LDData <- data.matrix(read.table(LDfile, sep = "\t"))
    LDdata <- LDData[, 11:42]
    colnames(LDdata) <- NULL
    LDMarray[, , i] <- LDdata
  }
  for (j in 1:length(summary[,1]))
  {
    Names[j] <- summary[i, 1]
  }
  dimnames(LDMarray) <- list(rownames(LDMarray), colnames(LDMarray), Names)
  return(LDMarray)
}
