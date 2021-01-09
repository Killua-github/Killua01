SCutfortTest <- function(LD, Summary)
{
  for (i in 1:length(Summary[, 1]))
  {
    CtDAMfile <- list.files(pattern = paste0("Ct", Summary[i, 1], ".txt"))
    CtDAMdata <- fread(CtDAMfile)
    d1 <- CtDAMdata[(1440*0+1):(1440*0+1440),]
    d2 <- CtDAMdata[(1440*1+1):(1440*1+1440),]
    d3 <- CtDAMdata[(1440*2+1):(1440*2+1440),]
    if (LD == "L")
    {
      LDd1 <- d1[1:720,]
      LDd2 <- d2[1:720,]
      LDd3 <- d3[1:720,]
    }
    else if (LD == "D")
    {
      LDd1 <- d1[721:1440,]
      LDd2 <- d2[721:1440,]
      LDd3 <- d3[721:1440,]
    }
    LDdata <- rbindlist(list(LDd1, LDd2, LDd3))
    date <- substr(CtDAMfile, start = 1, stop = 6)
    write.table(LDdata, paste0(date, Summary[i, 1], LD, ".txt"),
                sep = "\t", row.names = FALSE,
                col.names = FALSE, quote = FALSE)
  }
}
