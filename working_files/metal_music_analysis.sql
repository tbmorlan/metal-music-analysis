-- @block

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


-- @block
-- create function to query all metal music from each dataset.
-- if i wanted to, i could just upload the combined dataset with all genres
-- however this would make the database twice the size, which is not optimal and costs more resources.

CREATE OR REPLACE FUNCTION get_all_metal_music()
RETURNS TABLE(
    artist TEXT,
    asin TEXT,
    media TEXT,
    review_count NUMERIC,
    star_rating NUMERIC,
    title TEXT,
    year INTEGER,
    genre TEXT
) AS $$
DECLARE
    query TEXT := '';
    tbl RECORD;
    col RECORD;
    where_clause TEXT;
BEGIN
    -- loop over tables with "_metal_music" in the name to get all data
    -- this works because each metal genre has "_metal_music" as a suffix.
    FOR tbl IN
        SELECT 
            table_name
        FROM 
            information_schema.tables
        WHERE 
            table_schema = 'metal_music' AND table_name LIKE '%_metal_music'
    LOOP
        where_clause := '';
        
            -- null rows were found in the original function, which added nearly double the amount of rows.
            -- this was added after the fact to alleviate this issue.
        FOR col IN
            SELECT column_name
            FROM information_schema.columns
            WHERE table_name = tbl.table_name AND table_schema = 'metal_music'
        LOOP
            where_clause := where_clause || col.column_name || ' IS NOT NULL AND ';
        END LOOP;

        -- remove the last "AND"
        where_clause := left(where_clause, length(where_clause) - 4);

        -- construct the query for the current table
        query := query || 'SELECT * FROM ' || quote_ident(tbl.table_name) || ' WHERE ' || where_clause || ' UNION ALL ';
    END LOOP;

    -- Remove the last "UNION ALL" to make the query valid
    query := left(query, length(query) - 10);

    -- Execute the final query
    RETURN QUERY EXECUTE query;
END;
$$ LANGUAGE plpgsql;



-- @block
-- used to reset function while debugging
DROP FUNCTION IF EXISTS get_all_metal_music();


-- @block
-- select all the data using function which unions each table

SELECT
    *
FROM get_all_metal_music();