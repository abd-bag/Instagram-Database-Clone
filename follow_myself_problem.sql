/*  problem: SOLVED
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

--INCORRECT:
INSERT INTO follows2 (follower_id, followee_id) VALUES
(1, 1);
--CORECT:
INSERT INTO follows2 (follower_id, followee_id) VALUES
(1, 2);


-- SOLUTION:

DELIMITER $$
   
CREATE TRIGGER check_id_on_insert
  BEFORE INSERT ON follows2 FOR EACH ROW
  BEGIN
    IF NEW.follower_id = NEW.followee_id
    THEN 
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Do not follow yourself!';
    END IF;
  END;
$$

DELIMITER ;

DELIMITER $$
   
CREATE TRIGGER check_id_on_update
  BEFORE UPDATE ON follows2 FOR EACH ROW
  BEGIN
    IF (NEW.follower_id = OLD.followee_id OR NEW.followee_id=OLD.follower_id)
    THEN 
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Do not follow yourself!';
    END IF;
  END;
$$

DELIMITER ;