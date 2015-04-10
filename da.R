library(tm);
library(rJava);
library(RWeka);

countwords <- function(somestring) {
  result <- sapply(gregexpr("\\W+", somestring), length) + 1;
  return(result);
  
}

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7');


con <- file("en_US/en_US.twitter.txt", "r")
c_twitter <- readLines(con);

length(c_twitter);

wordcount1 <- lapply(c_twitter,countwords);
wordcount1 <- sum(unlist(wordcount1));

con <- file("en_US/en_US.blogs.txt", "r")
c_blogs <- readLines(con);

length(c_blogs);

wordcount2 <- lapply(c_blogs,countwords);
wordcount2 <- sum(unlist(wordcount2));

length(c_news);

con <- file("en_US/en_US.news.txt", "r")
c_news <- readLines(con);

wordcount3 <- lapply(c_news,countwords);
wordcount3 <- sum(unlist(wordcount3));



dir <- "en_US/twitter";

text <- Corpus(DirSource(dir),
                readerControl = list(reader = readPlain,
                                     language = "en_US",
                                     load = TRUE));

corpus <- Corpus(VectorSource(texts))

# process text (your methods may differ)
skipWords <- function(x) removeWords(x, stopwords("english"))
funcs <- list(tolower, removePunctuation, removeNumbers, stripWhitespace, skipWords)
a <- tm_map(corpus, FUN = tm_reduce, tmFuns = funcs)
a.dtm1 <- TermDocumentMatrix(a, control = list(wordLengths = c(3,10))) 


text <- tm_map(text, content_transformer(tolower));

text <- tm_map(text, removeNumbers);
text <- tm_map(text, stripWhitespace);
text <- tm_map(text, removePunctuation);

temp <- sapply(text, `[`);
temp <- temp[1];
temp <- unlist(temp);
text <- data.frame(temp, stringsAsFactors=FALSE);

n1 <- NGramTokenizer(text, Weka_control(min = 1, max = 1));
n2 <- NGramTokenizer(text, Weka_control(min = 2, max = 2));
n3 <- NGramTokenizer(text, Weka_control(min = 3, max = 3));

