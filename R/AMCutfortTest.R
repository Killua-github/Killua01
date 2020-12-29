AMCutfortTest <- function()
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
    AMD1 <- d1[1:720,]
    AMD2 <- d2[1:720,]
    AMD3 <- d3[1:720,]
    AMdata <- rbindlist(list(AMD1, AMD2, AMD3))
    date <- substr(CtDAMData, start = 1, stop = 6)
    name <- substr(CtDAMData, start = 9, stop = 12)
    write.table(AMdata, paste(date, name, "AM", ".txt", sep = ""),
                sep = "\t", row.names = FALSE,
                col.names = FALSE, quote = FALSE)
  }
}
