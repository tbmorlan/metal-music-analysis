-- @block


-- get an average of the ratings where there are more then 50 reviews (for analysis integrity to prevent a potential skew)
SELECT *
FROM black_metal_music
WHERE review_count > 50 AND artist = '1349'
ORDER BY artist;

-- @block
SELECT 
    artist,
    SUM(star_rating)
FROM black_metal_music
WHERE review_count > 50
GROUP BY artist;

-- @block
WITH average_ratings AS (
    SELECT
        artist,
        ROUND(AVG(star_rating), 1) AS average_stars
    FROM black_metal_music
    WHERE review_count > 50
    GROUP BY artist
)

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

