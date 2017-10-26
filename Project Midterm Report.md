Guidelines:
Project midterm report. By this time, you should have made some progress in cleaning up and understanding your data, and in running a few preliminary analyses. Your project midterm report should be no more than 3 pages, written in LaTeX or markdown, and posted in your project repository with the filename “midterm_report”. (The file extension should be either .tex + .pdf, or just .md.)

In the report, you should describe your data set in greater detail. Describe how you plan to avoid over (and under-)fitting, and how you will test the effectiveness of the models you develop. Include a few histograms or other descriptive statistics about the data. How many features and examples are present? How much data is missing or corrupted? How can you tell? You should also run a few preliminary analyses on the data, including perhaps some regressions or other supervised models, describing how you chose which features (and transformations) to use. Finally, explain what remains to be done, and how you plan to develop the project over the rest of the semester.


# Data set decription
Our data set include daily data of TB26	LTRA	10YrReal	10Yr	2Yr	YENUSD	RMBUSD	EURUSD	Oil	Gold	FTSE	Nikkei	S&P	SSEC	VIX	DJIA	RUSS Unem	NASDAQ from 3/19/03 to 10/17/17. There are some null values in data column Nikkei and SSEC, which needs to be amended. We decided to use interpolation to fill these missing values.

