-- @block
-- create new schema
CREATE SCHEMA metal_music;

-- @block
-- change search path so i dont have to specify schema each time i run a query (permanent, will have to change if i use a new db)
ALTER DATABASE postgres SET search_path TO metal_music;

-- @block
-- create table 
CREATE TABLE metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

-- @block
-- import data
COPY metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\working_files\working_datametal-music-unclean.csv'
DELIMITER ','
CSV HEADER;


-- @block
-- remove all null rows (because this is an analysis of every variable, null values *cannot* be used)
SELECT * 
FROM metal_music
WHERE artist IS NOT NULL
  AND asin IS NOT NULL
  AND media IS NOT NULL
  AND review_count IS NOT NULL
  AND star_rating IS NOT NULL
  AND title IS NOT NULL
  AND year IS NOT NULL
  AND genre IS NOT NULL;
