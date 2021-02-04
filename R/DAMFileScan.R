DAMFileScan <- function(yy, mm, dd, hours, mins, days)
{
  library(data.table)
  MM <- Month(mm)
  date0 <- paste(dd, MM, yy)
  Date <- list(date0)
  for (j in 1:days)
  {
    date <- DefineDate(yy, mm, dd, j)
    Date <- c(Date, date)
  }
  time1 <- DefineTime1(hours, mins)
  time2 <- DefineTime2(time1, days)
  DAMfileList <- list.files(pattern = "Monitor...txt")
  for (i in 1:length(DAMfileList))
  {
    DAMdata <- DAMfileList[i]
    DAMfile <- fread(DAMdata)
    date <- Date[[1]]
    c <- DAMfile[DAMfile$V2 == date, ]
    cDAMfile <- list(c)
    for (k in 2:(days + 1))
    {
      date <- Date[[k]]
      c <- DAMfile[DAMfile$V2 == date, ]
      cDAMfile <- c(cDAMfile, list(c))
    }
    cutDAMfile <- rbindlist(cDAMfile)
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
