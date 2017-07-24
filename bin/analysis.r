library(plyr)
library(ggplot2)
library(reshape2)

snvFiles <- Sys.glob("*-snvs-*.out")
snvs <- data.frame()

for (f in snvFiles) {
  x <- read.table(f, head=T, sep="\t")
  snvs <- rbind(snvs, x)
}

modelSummary <- read.table("model-summary.txt", head=T, sep="\t")
df <- join(snvs, modelSummary, by="build_id")

snvFilters <- c("FalsePositive", "FalsePositiveVcf","PASS", "VarFilterSnv")
df$Total <- rowSums(df[,snvFilters])

t <- df[,snvFilters]/df$Total
colnames(t) <- sprintf("%sRatio", colnames(t))
df <- cbind(df,t)

df$read_len <- factor(df$read_len)
ord <- unique(df[order(df$read_len), 'build_id'])
df$build_id  <- factor(df$build_id, levels=ord)

p <- ggplot(df, aes(x=build_id, y=PASSRatio, fill=read_len)) + 
     geom_bar(stat="identity", pos="dodge")

mdf <- melt(df, measure.vars=snvFilters)

p2 <- ggplot(mdf[mdf$variable!="PASS",],
             aes(x=build_id, y=value, fill=variable)) + 
      geom_bar(stat="identity", pos="dodge")

PP <- p2 + facet_grid(.~read_len, scales="free") + 
           theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())
