DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users 
(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos 
(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO users (username) VALUES
('BlueTheCat'),
('CharlieBrown'),
('ColtSteele');

INSERT INTO photos (image_url, user_id) VALUES
('/sadfasfasf', 1),
('/iyuiuyiy', 2),
('/vxcbxcaqqweoi', 2);




---------------------------------------------------------
SELECT photos.image_url, users.username
FROM photos
JOIN users
    ON photos.user_id = users.id;