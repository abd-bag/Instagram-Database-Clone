-- 5 olders users

SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

-- most popular registration date

SELECT 
    username,
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 1;

-- users with no photos

SELECT username AS 'users with no photos'
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

