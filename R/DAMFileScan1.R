DAMFileScan1 <- function(yy, mm, dd, hours, mins)
{
  library(data.table)
  MM <- Month(mm)
  date0 <- paste(dd, MM, yy)
  days <- 03
  for (j in 1:days)
  {
    date <- DefineDate(yy, mm, dd, j)
    assign(paste0("date", j), date)
  }
  time1 <- DefineTime1(hours, mins)
  time2 <- DefineTime2(time1, days)
  DAMfileList <- list.files(pattern = "Monitor...txt")
  for (i in 1:length(DAMfileList))
  {
    DAMdata <- DAMfileList[i]
    DAMfile <- fread(DAMdata)
    c1 <- DAMfile[DAMfile$V2 == date0, ]
    c2 <- DAMfile[DAMfile$V2 == date1, ]
    c3 <- DAMfile[DAMfile$V2 == date2, ]
    c4 <- DAMfile[DAMfile$V2 == date3, ]
    cutDAMfile <- rbindlist(list(c1, c2, c3, c4))
    CutDAMFile <- cutDAMfile[time1:time2, ]
    Y <- formatC(yy, width = 2, flag = "0")
    M <- formatC(mm, width = 2, flag = "0")
    D <- formatC(dd, width = 2, flag = "0")
    name <- substr(list(DAMdata), start = 8, stop = 9)
    write.table(CutDAMFile, paste0(Y, M, D, "CtM", 0, name, ".txt"),
                sep = "\t", row.names = FALSE, col.names = FALSE,
                quote = FALSE)
  }
}
