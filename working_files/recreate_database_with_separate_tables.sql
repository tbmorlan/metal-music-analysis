-- @block 
-- drop original working table
DROP TABLE metal_music;

-- @block
-- create new tables
CREATE TABLE alternative_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE black_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE british_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE death_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE pop_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE progressive_metal_music (
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INT,
    genre TEXT
);

CREATE TABLE thrash_metal_music (
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
-- input new data
COPY alternative_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\alternative-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY black_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\black-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY british_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\british-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY death_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\death-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY pop_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\pop-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY progressive_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\progressive-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY thrash_metal_music (artist, asin, media, review_count, star_rating, title, year, genre)
FROM 'C:\repositories\metal-music-analysis\data\cleaned_data\thrash-metal-music-cleaned.csv'
DELIMITER ','
CSV HEADER;