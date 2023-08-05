/* The datasets gotten from kaggle has been splitted into training and test file for modelling, so for the purpose of this analysis, i will be creating two tables for the files 
 while using the union clause to join them together*/

 -- creating a table named "googlestock" for the first csv file (the train dataset)

 ![gg1](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/ce3537d2-0e17-48af-a653-4252fe1a1ace)

-- creating another table named "googlestock2" for the second csv file (test data)

![gg2](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/f8ee7282-27da-4b94-b2e6-cfc4d32f7817)

-- merging the two tables together
![gg3](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/d347573d-2f6b-45bd-a1c4-e3af3432be09)


               ------------------Exploratory Data Analysis on the GoogleStock Data-------------------- 
                 
-- Calculating the average daily closing price
![gg4](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/79d3916e-826d-49bc-9e0f-3785fd145b1e)

-- Finding The highest/lowest closing price and their corresponding date
![gg5](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/c39d872e-0019-4de6-a69f-692555bae19f)

-- Total trading volume for each year
![gg6](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/59d5d1b9-60db-4e91-817f-fffc0b3ea9f6)

 -- Average trading volume for each months
![gg7](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/44f9ab9f-125c-49df-916f-83a474bf47ae)

 -- calculating the daily percentage change in the closing price
 ![gg8](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/ed45f114-95ef-4577-ab19-39cee01ecb75)

-- Days with the highest percentage gain in stock price
![gg9](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/eda72f18-2e55-4eb2-99a6-376849c10e8d)

 -- Days with the highest percentage loss in stock price
 ![gg10](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/f5554868-4145-4c2d-a0fa-c88117f2963b)

-- calculating the 30-day moving average of the closing price
![gg11](https://github.com/Adetunji22/GoogleStock_Trend_Analysis-/assets/127019986/8ac1f442-0226-4f57-831c-5b94bad41022)




