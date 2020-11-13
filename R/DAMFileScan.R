D11 <- function(Monitor, yy, MM, dd, hours, mins)
{
  mm <- Month(MM)
  time <- Hours +mins
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
    CutDAMFile <- cutDAMfile[time:(time -1 +(3 *24 *60)),]
    write.table(CutDAMFile, paste(dd, mm, yy, "CtM", 0,
                                  Monitor -1 +i, ".txt", sep = ""),
                sep = "\t", row.names = FALSE, col.names = FALSE,
                quote = FALSE)
  }
}
