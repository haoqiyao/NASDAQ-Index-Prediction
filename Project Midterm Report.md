Guidelines:
Project midterm report. By this time, you should have made some progress in cleaning up and understanding your data, and in running a few preliminary analyses. Your project midterm report should be no more than 3 pages, written in LaTeX or markdown, and posted in your project repository with the filename “midterm_report”. (The file extension should be either .tex + .pdf, or just .md.)

In the report, you should describe your data set in greater detail. Describe how you plan to avoid over (and under-)fitting, and how you will test the effectiveness of the models you develop. Include a few histograms or other descriptive statistics about the data. How many features and examples are present? How much data is missing or corrupted? How can you tell? You should also run a few preliminary analyses on the data, including perhaps some regressions or other supervised models, describing how you chose which features (and transformations) to use. Finally, explain what remains to be done, and how you plan to develop the project over the rest of the semester.

## Introduction

Frank and Mike are day traders in XYZ Company. One day after the stock market closed, Frank felt extremely tired and was sick of all the time and work he needed to put into this job by just staring at multiple trading screens and performing routined trades. So he came up to Mike and said, "Wouldn't it be cool if we can find out the trend of NASDAQ 100 automatically and just do trades on that? We don't need to stare at the screens anymore!" Mike said, "You know what? That is an interesing idea. I know some students in Cornell that might be able to do this. Let's me talk to them and see if they can realize your idea." So here we are, helping these two lazy employees.

First of all, what NASDAQ 100 is? It is a stock market index that made up of 100 non-financial companies' securities that are listed on NASDAQ. Generally, its trend represents the situation of U.S's economy. In order to predict its trend, we need to find data that might capture NASDAQ's movement, and build a model to optimize the accuracy.

## Data set decription

Summary:

Our data set include daily data of Long Term Treasury Rate,	10 Year Treasury Bill Rate, USD/YEN, USD/RMB, USD/EUR, Oil Price, Gold Price, FTSE 100 Index, Nikkei 225 Index, S&P 500 Index, SSEC Index, VIX Index, Dow Jone Industrial Average, Russell 2000 Index, Hang Seng Index, Unemployment Google Trend Index, Mortgage Google Trend Index, Investing Google Trend Index, Bankrupcy Google Trend Index, NASDAQ Volume, and NASDAQ Index from 3/19/03 to 10/17/17.

Reasons For Choosing These Data:

1. Risk-free rate that represent the trend of macroeconomy: Long Term Treasury Rate,	10 Year Treasury Bill Rate
2. Exchange rates that represent international trade and its stability: USD/YEN, USD/RMB, USD/EUR
3. Commodity prices that represent industrial development and global risk measure: Oil Price, Gold Price
4. Different Indices that represent different countries and districts' economy: FTSE 100 Index, Nikkei 225 Index, S&P 500 Index,  SSEC Index, VIX Index, Dow Jone Industrial Average, Russell 2000 Index, Hang Seng Index, NASDAQ Volume
5. Different Topics' Google Trend Data that represent people's emotions and concerns towards these topics: Unemployment Google Trend Index, Mortgage Google Trend Index, Investing Google Trend Index, Bankrupcy Google Trend Index

You can see that our data look like a structured portfolio, and we think that features in this portfolio might impact NASDAQ Index in different ways. 

Messy Data Problem: 
1. There are some null values in data column Nikkei, Hang Seng, and SSEC. We decided to use the average of non-null values which days are before and after the null values' days, to fill these missing values.
2. Google Trend Data are continuous so they will include non-trading days, we also manage to delete those non-trading days' values to maintain consistency.

There are 20 features and 3618 examples for each feature.

## Features Analysis

Here is the heatmap of our features' correlation:
![plot](plot/corr.jpg)

We can see that stock indices are highly correlated, and not much of this happen between stock indices and commodity. Suprisingly, Google trend indices show significant high correlation with risk-free rates and exchange rates.

Then we want to show plots of features. In order to make the trend more clear, we seperate them into different plots based on their scales:

![plot](plot/index1.jpg)![plot](plot/index2.jpg)![plot](plot/index3.jpg)![plot](plot/index4.jpg)![plot](plot/index5.jpg)

Then we calculate log return of NASDAQ 100 to do classification. The histogram of return is shown below:
![plot](plot/Logreturn.jpg)
We discard some of the outliers in log returns (10 of them). The amended histogram looks like this:
![plot](plot/Logreturn no extreme.jpg)
We can see NASDAQ 100 log return is nearly normally distributed.

## Preliminary analysis

We performed principal component analysis with respect to the features, and here is the result:

![plot](plot/pca.png)

We calculate the daily log return of NASDAQ Index, and define positive return as 1 and negative return as -1 respectively. As a preliminary analysis, we built one nonlinear model (classification tree) and one linear model (linear logistics regression)to predict the next day's NASDAQ index change direction using features of the previous day.

We divided the dataset into training set (3000 samples) and testing set (617 samples)

### Nonlinear model - Classification Tree

We attempt to use classification tree to explore whether the features of previous day could predict the next day's NASDAQ index change direction. Here is the classification derived from training set.


![plot](plot/ctree.jpeg)

The in the sample error on training set is 0.43, and the out of sample error on test set is 0.475.

### Linear model - Linear Logistics Regression

We use all 20 features to train the linear logistics regression model without regularizaiton in the training set and predict the index direction in the testing set using the testing sample. 

The result of the model shows that the prediction accuracy is 55.27%.

