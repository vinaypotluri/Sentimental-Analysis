# Source Code split in steps


#load the libraries

>library("ROAuth")
>library("twitteR")



#download SSL cacert for windows to handle the SSL Part

>download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")


# get the credentials
>reqURL <- "https://api.twitter.com/oauth/request_token"
>accessURL <- "https://api.twitter.com/oauth/access_token"
>authURL <- "https://api.twitter.com/oauth/authorize"
>consumerKey <- "aMs243oa1ix2OaUS2do5vafDk"
>consumerSecret <- "your key here"
>twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)



# authorize app using the Handshake method

>(twitCred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "Rcurl")))



# handshake_TRUE signifies it is authenticated
>twitCred


# Verify the status of OAuth authentication using the following command and it should return TRUE
>registerTwitterOAuth(twitCred)


# search for the tweets
>tweets=searchTwitter("$AAPL", n=1000,cainfo="cacert.pem")


# print all the tweets
>head(tweets)



returns the number of tweets
>length(tweets)


# Load this list of libraries
>library(twitteR)
>library(tm)
>library(wordcloud)
>library(RColorBrewer)



# searching for tweets containing the keywords “yahoo finance”
>tweet_cloud = searchTwitter("yahoo finance", n=100, lang="en",cainfo="cacert.pem")


# Extract the text from the tweets using sapply function
>text_cloud = sapply(tweet_cloud, function(x) x$getText())

# Creating corpus
>corpus = Corpus(VectorSource(text_cloud))


# creating document term matrix  
  matrix = TermDocumentMatrix(corpus,
   control = list(removePunctuation = TRUE,
   stopwords = c("yahoo", "finance"),
   removeNumbers = TRUE, tolower = TRUE))


# defining tdm as matrix
>m = as.matrix(matrix)


# Getting word counts in decreasing order
>frequent_words = sort(rowSums(m), decreasing=TRUE) 

# Creating a data frame with words and their frequencies
>dframe = data.frame(word=names(frequent_words), freq=frequent_words)


# Plot wordcloud
>wordcloud(dframe$word, dframe$freq, random.order=TRUE, colors=brewer.pal(8, "Dark2"))



# Image in image format
>png("yahoo finance.png", width=12, height=8, units="in", res=300)
>wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
>dev.off()

# Plyr allows the user to split a data set apart into smaller subsets, apply methods to the subsets, and combine the results.
> library(plyr)


# organize the twitter data using lapply
>tweets=lapply(tweets, function(t) t$getText())
>summary(tweets)


# write the tweets data frame to the file tweets.csv
>write.csv(tweets, file="tweets.csv")


# getting positive and negative words txt file
>positive_words=scan("C:\\Users\\Public\\Documents\\positive-words.txt",what="character",comment.char=";")

>negative_words=scan("C:\\Users\\Public\\Documents\\negative-words.txt",what="character",comment.char=";")



# code for sentiment analysis
>score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
    require(plyr)
    require(stringr)
     
    # we got a vector of sentences. plyr will handle a list
    # or a vector as an "l" for us
    # we want a simple array ("a") of scores back, so we use 
    # "l" + "a" + "ply" = "lapply":
    scores = laply(sentences, function(sentence, pos.words, neg.words) {
         
        # clean up sentences with R's regex-driven global substitute, gsub():
        sentence = gsub('[[:punct:]]', '', sentence)
        sentence = gsub('[[:cntrl:]]', '', sentence)
        sentence = gsub('\\d+', '', sentence)
        # and convert to lower case:
        sentence = tolower(sentence)
 
        # split into words. str_split is in the stringr package
        word.list = str_split(sentence, '\\s+')
        # sometimes a list() is one level of hierarchy too much
        words = unlist(word.list)
 
        # compare our words to the dictionaries of positive & negative terms
        pos.matches = match(words, pos.words)
        neg.matches = match(words, neg.words)
     
        # match() returns the position of the matched term or NA
        # we just want a TRUE/FALSE:
        pos.matches = !is.na(pos.matches)
        neg.matches = !is.na(neg.matches)
 
        # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
        score = sum(pos.matches) - sum(neg.matches)
 
        return(score)
    }, pos.words, neg.words, .progress=.progress )
 
    scores.df = data.frame(score=scores, text=sentences)
    return(scores.df)
}



# perform sentiment analysis for the dataset tweets and store it in Results
>Results=score.sentiment(tweets,positive_words,negative_words)

# getting the summary of the Results
>summary(Results)

# plot histogram
>hist(Results$score)













