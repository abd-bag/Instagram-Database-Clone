/*  problem: unsolved
    follower can follow himself
*/

CREATE TABLE follows2 
(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows2 (follower_id, followee_id) VALUES
(1, 1);

INSERT INTO follows2 (follower_id, followee_id) VALUES
(1, 2);