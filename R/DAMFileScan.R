DAMFileScan <- function(readname, number, writenmae)
{
  #data.tableを呼び出す
  library("data.table")
  #元データを読み込む（ヘッターなし）
  file <- fread(readname)
  
  #行の選択
  cutfile <- file[number:(number+4319), ]
  write.table(cutfile, "writename",
              sep = "\t", row.names = F, col.names = F)
}