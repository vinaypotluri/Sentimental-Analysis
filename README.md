Sentiment Analysis using for Stock Market Prediction
====================

Language: R
Environment: RStudio

The project is part of Machine Learning which involves tracking stock market moods on a regular basis to predict the future value of a stock from the wordcloud extracted from sites like Yahoo! Finance. This application does not make any claims to get rich but instead helps the user understand the market moods and stocks based on its past performance.


This is a step by step procedure to make predictions. Hence the Source code will be pasted in the ReadMe file


**load the libraries**                                                
\>library("ROAuth")                                      
\>library("twitteR")


**download SSL cacert for windows to handle the SSL Part**                                
\>download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")


