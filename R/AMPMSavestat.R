AMPMSavestat <- function(out)
{
  dimnames(out) <- list(rownames(out), colnames(out),
                        dimnames(AMPMMarray)[[3]])
  b <- matrix(rep(paste("C", c(1:32), sep = "")), ncol = 32)
  row.names(b) <- dimnames(out)[[3]][1]
  AMPMstat <- out[, , 1]
  AMPMstat <- rbind(b, AMPMstat)
  for (i in 2:length(out[1, 1, ])) {
    row.names(b) <- dimnames(out)[[3]][i]
    AMPMstat <- rbind(AMPMstat, b, out[, , i])
  }
  write.table(AMPMstat, paste("stat", AMPM, ".txt", sep = ),
              col.names = FALSE, row.names = TRUE,sep = "\t", quote = FALSE)
}
