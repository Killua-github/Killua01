DAMFileScan <- function(Monitor, dd, mm, yy)
{
  DAMfileList <- list.files(pattern = "Monitor...txt")
  library(data.table)
  for (i in 1:length(DAMfileList))
  {
    DAMdata <- DAMfileList[i]
    DAMfile <- fread(DAMdata)
    c1 <- DAMfile[DAMfile$V2 == paste(dd, mm, yy, sep = " "),]
    c2 <- DAMfile[DAMfile$V2 == paste(dd +1, mm, yy, sep = " "),]
    c3 <- DAMfile[DAMfile$V2 == paste(dd +2, mm, yy, sep = " "),]
    c4 <- DAMfile[DAMfile$V2 == paste(dd +3, mm, yy, sep = " "),]
    cutDAMfile <- rbindlist(list(c1, c2, c3, c4))
    CutDAMFile <- cutDAMfile[541:4860, ]
    write.table(CutDAMFile, paste(dd, mm, yy, "CtM", 0,
                                  Monitor - 1 + i, ".txt", sep = ""),
                sep = "\t", row.names = FALSE, col.names = FALSE,
                quote = FALSE)
  }
}
