SSavestat <- function(LDstat, Outline, LD)
{
  Channel <- matrix(rep(paste0("C", c(1:32))), ncol = 32)
  row.names(Channel) <- Outline[1, 1]
  LDStat <- LDstat[, , 1]
  LDStat <- rbind(Channel, LDStat)
  for (i in 2:length(Outline[, 1]))
  {
    row.names(Channel) <- Outline[i, 1]
    LDStat <- rbind(LDStat, Channel, LDstat[, , i])
  }
  write.table(LDStat, paste0("stat", "_", LD, ".txt"),
              col.names = FALSE, row.names = TRUE, sep = "\t", quote = FALSE)
}
