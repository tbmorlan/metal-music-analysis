-- @block


-- get an average of the ratings where there are more then 50 reviews (for analysis integrity to prevent a potential skew)
SELECT
    artist,
    title,
    review_count,
    ROUND(AVG(star_rating), 1) AS average_rating
FROM black_metal_music
WHERE review_count > 50
GROUP BY artist, title, review_count
ORDER BY average_rating DESC;
