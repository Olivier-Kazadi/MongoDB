-- Création de la vue session_and_user
CREATE OR REPLACE VIEW session_and_user AS
SELECT
    s.session_id,
    s.user_id AS session_user_id,
    s.connected_at,
    u.user_id AS user_user_id,
    u.firstname,
    u.lastname,
    u.email,
    u.username,
    u.password,
    u.created_at
FROM
    session_table s
JOIN
    user_table u ON u.user_id = s.user_id;

-- Sélection de toutes les données de la vue
SELECT * FROM session_and_user;