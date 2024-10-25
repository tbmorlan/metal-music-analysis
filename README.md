# Metal Music Analysis

I love metal music and I wanted to learn some more about how certain genres, years, and artists perform.

[Dataset Used: Metal Music ratings and review counts from Amazon](https://www.kaggle.com/datasets/patkle/metal-music-ratings-and-review-counts-from-amazon/data)


[Cleaned Data](data/cleaned_data/all-metal-music-cleaned.csv)

### Index
1. [Data Cleaning](#data-cleaning)
2. [Black Metal Reviews Analysis](#black-metal-reviews-analysis)

# Processes & Analyses

## Data Cleaning

*There was a significant number of rows with insufficient data. Whether this be null values, or incompatible data types in certain columns due to (probable) issues with the web scraper used to collect the data.*

1. Add genre column to each dataset.
    - "thrash_and_speed_metal.csv" was shortened to thrash metal due to the terms being used interchangeably.
2. Append datasets with short [python script](working_files/append_csv.py).

```
import pandas as pd
import os

# set path
csv_folder = 'working_data'

# list csv files
csv_files = [f for f in os.listdir(csv_folder) if f.endswith('.csv')]

# read and combine data
combined_data = pd.concat([
    pd.read_csv(os.path.join(csv_folder, file)) 
    for file in csv_files], ignore_index=True)

# save to new csv
output = 'metal-music.csv'
combined_data.to_csv(output, index=False)
```
3. Remove random data in columns that shouldn't be there (char in numeric columns).
4. Create temporary database and remove all null values [Completed using created_metal_music_database.sql](working_files/create_metal_music_database.sql)
    - Cannot perform analysis with null due to every value in table needed.
5. Separate files by genre again (appended initially to make cleaning easier).
6. Final product of clean data found in [cleaned_data](data/cleaned_data/)

## Black Metal Reviews Analysis

**Goal(s):**

*Query and visualize information about black metal reviews to see which artists and albums performed the best.*

*~~Check to see if certain time periods performed better (i.e. if older black metal is more popular than newer black metal). This question is from my personal favoritism for older black metal music, so I'm curious to see if the reviews on Amazon support my mindset.~~* **Not possible due to dates not being accurate in dataset. The 'year' is potentially the year they were added to Amazon?**

*Check to see if reviews were higher if physical media was purchased compared to MP3 files.*

1. Write query to get the average ratings per artist where there are more then 50 reviews. 
    - Limited to more than 50 reviews for analysis integrity to prevent a potential skew.
```
-- separate cte to query the average stars for every album released by artist
WITH average_ratings AS (
    SELECT
        artist,
        ROUND(AVG(star_rating), 1) AS average_stars
    FROM black_metal_music
    WHERE review_count > 50
    GROUP BY artist
)

-- join average_ratings and get basic information provided by dataset
SELECT
    b.artist,
    b.title,
    b.media,
    b.review_count,
    b.star_rating,
    a.average_stars
FROM average_ratings AS a
INNER JOIN black_metal_music AS b
    ON a.artist = b.artist
WHERE review_count > 50
ORDER BY b.artist;
```
