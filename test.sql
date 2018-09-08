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


---------------------------------------------------------------
CREATE TRIGGER follows2valuecheckTrigger 
BEFORE INSERT 
ON follows2
  FOR EACH ROW BEGIN
    IF (NEW.follower_id = NEW.followee_id) THEN
      SET @msg := 'Error: follower_id and followee_id can not be same.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
    
CREATE TRIGGER follows2valuecheckTriggerOnUpdate
BEFORE UPDATE
ON follows2
  FOR EACH ROW BEGIN
    IF (NEW.follower_id = OLD.followee_id OR NEW.followee_id=OLD.follower_id) THEN
      SET @msg := 'Error: follower_id and followee_id can not be same.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;


