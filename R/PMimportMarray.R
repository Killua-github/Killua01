PMimportMarray <- function()
{
  files <- list.files(pattern = "......M0..PM.txt")
  t <- array(0, dim = c(720 * 3, 32, length(files)))
  for (i in 1:length(files))
  {
    file.name <- files[i]
    a <- data.matrix(read.table(file.name, sep = "\t"))
    b <- a[, 11:42]
    colnames(b) <- NULL
    t[, , i] <- b
  }
  for (j in 1:length(files))
  {
    files[j] <- substring(files[j], nchar(files[j]) -9, nchar(files[j]) -4)
  }
  dimnames(t) <- list(rownames(t), colnames(t), files)
  return(t)
}
