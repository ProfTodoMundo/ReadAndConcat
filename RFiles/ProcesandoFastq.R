library(ShortRead)
library(ggplot2)
# <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>> <<>>
# read fastq file
fq <- readFastq('cdc5_1_S9_R1_001.fastq')
head(fq)
summary(fq)
# look the dna sequences
reads <- sread(fq)
head(reads)
widths <- as.data.frame(reads@ranges@width)
ggplot(widths)+
  geom_histogram(aes(x=reads@ranges@width))
# graph the quality scores
quals= quality(fq)
numqscores <- as(quals,'matrix')
avgscore <- rowMeans(numqscores)
avgscore <- as.data.frame(avgscore)
ggplot(avgscore) + geom_histogram(aes(x=avgscore))

avgscore <- rowMeans(numqscores,na.rm = T)
avgscore <- as.data.frame(avgscore)
ggplot(avgscore) + geom_histogram(aes(x=avgscore))
