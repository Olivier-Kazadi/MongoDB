CREATE TABLE IF NOT EXISTS username_history (
    username_history_id SERIAL PRIMARY KEY,
    user_id INT,
    username_new VARCHAR(255)
);

-- Créer la fonction pour le trigger
CREATE OR REPLACE FUNCTION trigger_update_username_fonct()
RETURNS TRIGGER AS $$
BEGIN
    -- Si l'ancien username est différent du nouveau, insérer dans username_history
    IF OLD.username IS DISTINCT FROM NEW.username THEN
        INSERT INTO username_history (user_id, username_new)
        VALUES (NEW.user_id, NEW.username);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

Créer le trigger
CREATE TRIGGER trigger_update_username
BEFORE INSERT OR UPDATE ON user_table
FOR EACH ROW
EXECUTE FUNCTION trigger_update_username_fonct();

INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES ('Kenneth', 'Vasquez', 'sandovalmichael@example.com', 'saundersa', '_9K)RHO&0g', '2023-06-10 13:49:20');
INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES ('Amy', 'Lee', 'kristen64@example.net', 'andreafrazier', '^+Dd&!xR73', '2023-03-14 02:15:07');
INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES ('Michelle', 'Smith', 'xcarter@example.com', 'fmitchell', '*37XJhwYNR', '2023-03-17 15:47:04');
INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES ('Cody', 'Thomas', 'dskinner@example.net', 'fergusonbria', '&u0Fux8#)', '2023-01-15 06:57:08');
INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES ('William', 'Quinn', 'james42@example.net', 'kristaguzman', 's6BapP*q&6', '2023-05-10 01:41:03');

UPDATE user_table SET username = 'user1_updated' WHERE user_id = 1;
UPDATE user_table SET username = 'user2_updated' WHERE user_id = 2;
UPDATE user_table SET username = 'user3_updated' WHERE user_id = 3;
UPDATE user_table SET username = 'user4_updated' WHERE user_id = 4;
UPDATE user_table SET username = 'user5_updated' WHERE user_id = 5;

SELECT * FROM username_history ;