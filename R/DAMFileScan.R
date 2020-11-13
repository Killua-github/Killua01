DAMFileScan <- function(yy, MM, dd, hours, mins)
{
  mm <- Month(MM)
  time <- 1 +hours *60 +mins
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
    Y <- formatC(yy, width = 2, flag = "0")
    M <- formatC(MM, width = 2, flag = "0")
    D <- formatC(dd, width = 2, flag = "0")
    name <- substr(list(DAMdata), start = 8, stop = 9)
    write.table(CutDAMFile, paste(Y, M, D, "CtM", 0,
                                  name, ".txt", sep = ""),
                sep = "\t", row.names = FALSE, col.names = FALSE,
                quote = FALSE)
  }
}
