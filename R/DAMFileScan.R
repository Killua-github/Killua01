D <- function()
{
  library("lubridate")
  date1 <- ("16 Sep 20")
  date2 <- ("16 Sep 20")
  startdate <- dmy_hms(date1)
  enddate <- dmy_hms(date2)
  cut_interval <- interval(start = startdate, end = enddate)
  filelists <- list.files(pattern = "Monitor...txt$")
  library("data.table")
  for (i in 1:length(filelists))
  {
    file <- fread(filelists[i])
    #データを日付型にする
    timecolumn <- as.POSIXlt(file$V2:V3, format = "%d%m%Y %H:%M:%S",
                             tz = "Japan")
    cut_file <- file[cut_interval, ]
    write.table(cut_file, file = "2010091919CtM019.txt",
                sep = "\t", row.names = F, col.names = F, quote = F)
  }
}
