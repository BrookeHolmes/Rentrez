ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
library(rentrez)
library(dplyr)
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

Sequences<-unlist(strsplit(Bburg,split="\\n{2}"))

header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences <- data.frame(Name=header,Sequence=seq)

Sequences <- gsub("\n", "", Sequences$Sequence)

Sequences<-data.frame(Name=header,Sequence=Sequences)
Sequences
write.csv(Sequences, "Sequences.csv")