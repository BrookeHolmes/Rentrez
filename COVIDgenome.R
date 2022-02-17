library(rentrez)
covidSeq<-entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

covidSeq = unlist(strsplit(covidSeq,"complete genome\n"))
#removes the \n from the sequence and assign it to a new variable.
Sequence = gsub("\n", "", covidSeq[2])

Sequence

#spikeProtein <- seq_string[21563:25384]
#spikeProtein


spikeProtein <- sub("(\\w+)(ATGTTTGTTTTTCTTGTTTTA)(\\w+)(\\GTCAAATTACATTACACATAA)(\\w+)","\\2\\3\\4", Sequence)
spikeProtein

# This gene is highly conserved because the first 97 sequences have a 100% sequence identity.  
# The most unique 3 variant still have a 99.87% sequence identity. 
# There is minimal variation in the coding sequence of the spike protein.
