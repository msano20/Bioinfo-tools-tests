library(BiocManager)
library(GEOquery)
library(pheatmap)
dir <- ("C:/Path/to/directory")
setwd(dir)

gse = getGEO("GSE181122", GSEMatrix = TRUE, destdir = dir)

show(pData(phenoData(gse[[1]]))[, c(1,2,6,9,12)])

expset <- (read.table("GSE181122_cRPKM_AND_COUNTS-araTha10-6.tab",
                      header=TRUE, sep = "\t", row.names=1, as.is=TRUE))

dim(expset)
colnames(expset)

count_removal <- expset[,c(1,2,4,6,8,10,12)]
exsubset <- na.omit(count_removal)

numvalues <- exsubset[rowSums(exsubset[,-1]) > 8000,]

pheatmap(numvalues[,-1], labels_row = numvalues[,1])