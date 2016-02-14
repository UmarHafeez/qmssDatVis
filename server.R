#Hw1 Server
#Umar Hafeez

library(streamR)

library(tm)
library(wordcloud)

load("my_oauth.Rdata")


Sanders.df <- readRDS("BStweets.Rda")
Sanders.df$text <- sapply(Sanders.df$text, function(row) iconv(row, "latin1", "ASCII", sub=""))
SandersCloud <- paste(unlist(Sanders.df$text), collapse =" ") 
SandersCloud <- Corpus(VectorSource(SandersCloud))
SandersCloud <- tm_map(SandersCloud, PlainTextDocument)
SandersCloud <- tm_map(SandersCloud, removePunctuation)
SandersCloud <- tm_map(SandersCloud, removeWords, stopwords('english'))
SandersCloud <- tm_map(SandersCloud, stemDocument)
SandersCloud <- tm_map(SandersCloud, content_transformer(tolower),lazy=TRUE)
SandersCloud <- tm_map(SandersCloud, PlainTextDocument)


Clinton.df <- readRDS("HCtweets.Rda")
Clinton.df$text <- sapply(Clinton.df$text, function(row) iconv(row, "latin1", "ASCII", sub=""))
ClintonCloud <- paste(unlist(Clinton.df$text), collapse =" ") 
ClintonCloud <- Corpus(VectorSource(ClintonCloud))
ClintonCloud <- tm_map(ClintonCloud, PlainTextDocument)
ClintonCloud <- tm_map(ClintonCloud, removePunctuation)
ClintonCloud <- tm_map(ClintonCloud, removeWords, stopwords('english'))
ClintonCloud <- tm_map(ClintonCloud, stemDocument)
ClintonCloud <- tm_map(ClintonCloud, content_transformer(tolower),lazy=TRUE)
ClintonCloud <- tm_map(ClintonCloud, PlainTextDocument)


shinyServer(
  function(input, output) {

    output$wordcloudHC <- renderPlot({
      wordcloud(ClintonCloud, max.words = 100, random.order = FALSE,scale=c(8,1),colors=brewer.pal(8, "Dark2"))
    })
    
    
    output$wordcloudBS <- renderPlot({
      wordcloud(SandersCloud, max.words = 100, random.order = FALSE,scale=c(8,1),colors=brewer.pal(8, "Dark2"))
    })
    
    }
    )
    