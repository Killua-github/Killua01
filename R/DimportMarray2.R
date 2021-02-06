DimportMarray2 <- function()
{
  files <- list.files(pattern = "CtM....txt$")
  sample <- data.matrix(read.table(files[1], sep="\t"))
  Marray <- array(0, dim=c(length(sample[, 1]), 32, length(files)))
  for (i in 1:length(files))
  {
    File <- files[i]
    Data <- data.matrix(read.table(File, sep="\t"))
    data <- Data[, 11:42]
    colnames(data) <- NULL
    Marray[, , i] <- data
  }
  for (i in 1:length(files))
  {
    files[i] <- substring(files[i],
                          nchar(files[i]) - 7, nchar(files[i]) - 4)
  }
  dimnames(Marray) <- list(rownames(Marray), colnames(Marray), files)
  return(Marray)
}
