SSavestat <- function(LDstat, Summary, LD)
{
  Channel <- matrix(rep(paste0("C", c(1:32))), ncol = 32)
  row.names(Channel) <- Summary[1, 1]
  LDStat <- LDstat[, , 1]
  LDStat <- rbind(b, LDStat)
  for (i in 2:length(Summary[, 1]))
  {
    row.names(b) <- Summary[i, 1]
    LDStat <- rbind(LDStat, b, LDstat[, , i])
  }
  write.table(LDStat, paste0("stat", "_", LD, ".txt"),
              col.names = FALSE, row.names = TRUE, sep = "\t", quote = FALSE)
}
