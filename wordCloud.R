#!/usr/bin/env Rscript

library(readr)
library(dplyr)
library(wordcloud)
library(RColorBrewer)

colorsScheme <- brewer.pal(8,"Paired")
df <- read_csv('wordCount.csv',col_names=c('word','count')) %>%
	filter(!grepl('\\.|\\||\\(|\\#|\\&|\\*|\\+|\\/|\\)|\\!|\\-|\\=| |\\"|\\`',word)) %>%
	filter(!grepl('[0-9]',word)) %>%
	mutate(word = tolower(word)) %>%
	group_by(word) %>%
	summarize(count = sum(count)) %>%
	filter(!grepl('and|or|to|the|an|a|in|of|that|were|is|on|by|with|not|be|from',word))

pdf("wordcloud.pdf", 10,10)
wordcloud(df$word,df$count,color=colorsScheme,max.words=800,
		  scale=c(8,.2), random.order=FALSE, rot.per=.15)
dev.off()
