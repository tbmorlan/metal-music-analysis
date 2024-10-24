# Metal Music Analysis

I love metal music and I wanted to learn some more about how certain genres, years, and artists perform.

[Dataset Used](https://www.kaggle.com/datasets/patkle/metal-music-ratings-and-review-counts-from-amazon/data)


[Cleaned Data](data/cleaned_data/metal-music-cleaned.csv)

# Process

## Data Cleaning

1. Add genre column to each dataset
    - "thrash_and_speed_metal.csv" was shortened to thrash metal due to the terms being used interchangeably
2. Append datasets with short [python script](working_files/append_csv.py)

```
import pandas as pd
import os

# set path
csv_folder = 'working_data'

# list csv files
csv_files = [f for f in os.listdir(csv_folder) if f.endswith('.csv')]

# read and combine data
combined_data = pd.concat([pd.read_csv(os.path.join(csv_folder, file)) for file in csv_files], ignore_index=True)

# save to new csv
output = 'metal-music.csv'
combined_data.to_csv(output, index=False)
```

3. Remove random data in columns that shouldn't be there (char in numeric columns)
4. Remove all null values (cannot perform analysis with null due to every value in table needed)
5. Separate files by genre again (appended initially to make cleaning easier)