directory <- "/home/sali9490/genome_analysis/analyses/RNA-Seq/02_differential_expression"
sampleFiles <- grep("counts.txt",list.files(directory),value=TRUE)
condition <- c('BH','BH','BH','serum','serum','serum')
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = condition)

library("DESeq2")

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)

dds <- DESeq(dds)
res <- results(dds)
res

write.table(sort(res["log2FoldChange"]), file="/home/sali9490/genome_analysis/analyses/PacBio/03_annotation/resultlog2.tsv", quote=FALSE, sep="\t")
plotMA(res)
