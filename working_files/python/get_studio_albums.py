import pandas as pd

# import data
address = '../working_data/data/all-metal-music-cleaned.csv'
metal_df = pd.read_csv(address)

# remove duplicates
metal_no_dupes = metal_df.drop_duplicates(subset=['title'])

# remove keywords that indicate a re-release or live record
metal_no_dupes_only_albums = metal_no_dupes[~metal_no_dupes.title.str.contains("live|best|collection|alternate|archive|single|edition", case=False)]

# save file
metal_no_dupes_only_albums.to_csv('studio_albums_only.csv', index=False)