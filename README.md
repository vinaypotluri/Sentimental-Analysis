Stock Market Prediction Using Twitter Sentiment Analysis
====================

**Language: R                                                                         
Environment: RStudio**

The project is part of Machine Learning which involves tracking stock market moods on a regular basis to predict the future value of a stock from the wordcloud extracted from sites like Yahoo! Finance. This application does not make any claims to get rich but instead helps the user understand the market moods and stocks based on its past performance.

![](http://i.imgur.com/CdQ8O7c.png)


**Sentiment analysis**  - Refers to the use of natural language processing, text analysis and computational linguistics to identify and extract subjective information in source materials. 
Sentiment analysis is the task of identifying whether the opinion expressed in a text is positive or negative in general about a particular topic or context.

**Twitter**  - Twitter is an online social networking and microblogging service that enables users & organisations to send/read messages, called "tweets". Users/organisations are free to post their content (tweets) to their followers(listeners) read them. It can be classified as positive, negative and neutral. Depending on the areas of application we can even make advanced classifications and judge if the user is angry, happy or sad. Twitter provides a unique functionality to access their tweets with the help of their APIs to filter out the required data.

**Stock Market**  -    A stock market is the aggregation of buyers and sellers of stocks (shares); these are securities listed on a stock exchange as well as those only traded privately.
In other words it's a very huge pool of buyers and sellers trying to make money. 
A stock market is always unpredictable with the values changing rapidly
Some of the popular stock exchanges are New York Stock Exchange, London Stock Exchange, Nasdaq, BSE & NSE.


**Sources of Information**  - Popular sites like yahoo news & google news have large chunks of research data which try to predict the stock market in real time.

Steps:
-------
* Fetch Twitter Data
* Text Cleaning
* Stemming
* Frequent Terms
* Word Cloud
* Prediction


### Gathering News
This 1st step here starts with gathering of News from different sources like Google finance, Yahoo finance, twitter, stock market news, etc. We have loads and loads of data but only the relevant data should be extracted for our purpose.

 
### Creating News Corpus
For each news agency we try create a corpse initially. 
Corpuses are datasets here
Here we create a corpus using Yahoo! Finance.
A corpus or text corpus is a large and structured set of texts. They are used to do statistical analysis and hypothesis testing.


### Fetching Data
Connection is authenticated using oauth and Data is fetched using the twitteR library.
Using these libraries datasets are created.

### Parsing data
Parsing is a method of breaking down the available data into parts so that it can be processed for sentimental analysis. The sentences here are broken down and parsed to match the sentimental analysis.

### Creating sentimental words
Built-In set of words in R are available at tm.plugin.tags                                            
List of sentiment words from Jeffrey Breen's tutorial                                              
http://jeffreybreen.wordpress.com/2011/07/04/twitter-text-mining-r-slides/

### Scoring Text Corpus
Each and every tweet is processed and classified for positive & negative terms based on the sentiment word list.                                                                                   
**Positive : phenomenal , great, high, raise, good,etc                                                     
Negative: Fall, poor, bad, etc**                                                            
Count is calculated for every such desired word in the tweets and the aggregate is calculated.

### Results
* Histograms will be plotted for different stocks and compared with other data sources 
* Sentiment scores are able to predict the movement of stocks quite accurately.
* Sentence Sentiment scores are often more accurate because of data sourcing from many sources. 



Areas of Application
===================
* Forex Trading
* Investor's portfolio for prediction
* To arrive at happiness index of the customers
* Determining product recommendations
* Predicting Stock market moods
* As a competitive marketing tool


