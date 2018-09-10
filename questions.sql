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

-- most popular photo (and author)

SELECT 
    username,
    photos.image_url,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- calculate avg number of photos per user

SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;
    
-- five most popular hashtags

SELECT 
    tags.tag_name,
    COUNT(*) AS total
FROM photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- finding bots = users who have liked every single photo

SELECT 
    username,
    user_id,
    COUNT(*) AS num_likes
FROM users
INNER JOIN likes
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);