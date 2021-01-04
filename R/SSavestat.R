SSavestat <- function(LDstat, LD)
{
  dimnames(LDstat) <- list(rownames(LDstat), colnames(LDstat),
                           dimnames(AMPMMarray)[[3]])
  b <- matrix(rep(paste("C", c(1:32), sep = "")), ncol = 32)
  row.names(b) <- dimnames(LDstat)[[3]][1]
  AMPMstat <- LDstat[, , 1]
  AMPMstat <- rbind(b, AMPMstat)
  for (i in 2:length(LDstat[1, 1, ]))
  {
    row.names(b) <- dimnames(LDstat)[[3]][i]
    AMPMstat <- rbind(AMPMstat, b, LDstat[, , i])
  }
  write.table(AMPMstat, paste("stat", LD, ".txt", sep = ""),
              col.names = FALSE, row.names = TRUE,sep = "\t", quote = FALSE)
}
