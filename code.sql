 /* the datasets gotten from kaggle has been splitted into training and test file for modelling, 
 so for the purpose of this analysis, i will be creating two tables for the files 
 while using the union clause to join them together*/
 
 -- creating a table named "googlestock" for the first csv file (the train dataset)
 
 drop table if exists googlestock
 
 create table googlestock (Date	   date,
						   Open	     numeric,
						   High       numeric,
						   Low	       numeric,
						   Close	    numeric,
						   Adj_Close	 numeric,
						   Volume         int
)

 copy  googlestock from 'C:\Program Files\PostgreSQL\9.6\data\Google_Stock_Train (2010-2022).csv' csv header
 
select * from googlestock

 -- creating another table named "googlestock2" for the second csv file (test data)
 drop table if exists googlestock2
 
 create table googlestock2 (Date	   date,
						   Open	     numeric,
						   High       numeric,
						   Low	       numeric,
						   Close	    numeric,
						   Adj_Close	 numeric,
						   Volume         int
)

 copy  googlestock2 from 'C:\Program Files\PostgreSQL\9.6\data\Google_Stock_Test (2023).csv' csv header
 
select * from googlestock2

 -- merging the two tables together
 
 create table NewGoogleStock as (
 select * from googlestock
	 union
  select * from googlestock2
  )

select * from NewGoogleStock


 ------------------Exploratory Data Analysis on the GoogleStock Data--------------------
 
 -- Calculating the average daily closing price
 
 select round(avg(close),2) :: money as average_closing_price from newgooglestock
 
 -- The highest/lowest closing price 
 (select date, round(close,2) ::money as close from newgooglestock
  order by close desc limit 1)
     union
 (select date, round(close,2) ::money as close from newgooglestock
 order by close asc limit 1 )

 -- Total trading volume for each year
 
 select extract(year from date) as years, sum(volume) as volume from newgooglestock 
  group by years order by years asc

 -- Average trading volume for each months
 
 select to_char(date,'month') as months, round(avg(volume),1) as avg_volume from newgooglestock
  group by months order by avg_volume asc

 -- calculating the daily percentage change in the closing price
  with pct_change as ( select date, close, lag(close) over(order by date ) as prev_close from newgooglestock 
			   group by date, close order by date
  )
 select date, close, round(((close-prev_close)/prev_close * 100),2) as daily_percentage_change from pct_change 
 
  -- Days with the highest percentage gain in stock price

with pct_gain as ( select date, close, lag(close) over(order by date ) as prev_close, 
					round(((close-lag(close) over(order by date ))/lag(close) over(order by date ) * 100),2) as daily_percentage_change
					from newgooglestock 
			   group by date, close order by date
  )
 select date, close, prev_close, daily_percentage_change, dense_rank()
 over(order by daily_percentage_change desc) from pct_gain where prev_close notnull

 -- Days with the highest percentage loss in stock price
 
with pct_loss as ( select date, close, lag(close) over(order by date ) as prev_close, 
					round(((close-lag(close) over(order by date ))/lag(close) over(order by date ) * 100),2) as daily_percentage_change
					from newgooglestock 
			   group by date, close order by date
  )
 select date, close, prev_close, daily_percentage_change, dense_rank()
 over(order by daily_percentage_change) from pct_loss where prev_close notnull

-- calculating the 30-day moving average of the closing price

select date, close, avg(close)over(order by date rows between 29 preceding and current row ) as moving_avg from newgooglestock
