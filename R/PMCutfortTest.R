PMCutfortTest <- function()
{
  CtDAMdata <- list.files(pattern = "......CtM0...txt")
  library(data.table)
  for (i in 1:length(CtDAMdata))
  {
    CtDAMData <- CtDAMdata[i]
    CtDAMfile <- fread(CtDAMData)
    d1 <- CtDAMfile[(1440*0+1):(1440*0+1440),]
    d2 <- CtDAMfile[(1440*1+1):(1440*1+1440),]
    d3 <- CtDAMfile[(1440*2+1):(1440*2+1440),]
    PMD1 <- d1[721:1440,]
    PMD2 <- d2[721:1440,]
    PMD3 <- d3[721:1440,]
    PMdata <- rbindlist(list(PMD1, PMD2, PMD3))
    date <- substr(CtDAMData, start = 1, stop = 6)
    name <- substr(CtDAMData, start = 9, stop = 12)
    write.table(PMdata, paste(date, name, "PM", ".txt", sep = ""),
                sep = "\t", row.names = FALSE,
                col.names = FALSE, quote = FALSE)
  }
}
