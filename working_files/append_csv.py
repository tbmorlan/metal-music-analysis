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

