SimportMarray <- function(LD, Summary)
{
  LDMarray <- array(0, dim = c(720 * 3, 32, length(Summary[, 1])))
  for (i in 1:length(Summary[, 1]))
  {
    LDfile <- list.files(pattern = paste0(Summary[i, 1], LD, ".txt"))
    LDData <- data.matrix(read.table(LDfile, sep = "\t"))
    LDdata <- LDData[, 11:42]
    colnames(LDdata) <- NULL
    LDMarray[, , i] <- LDdata
  }
  dimnames(LDMarray) <- list(rownames(LDMarray), colnames(LDMarray),
                             Summary[, 1])
  return(LDMarray)
}
