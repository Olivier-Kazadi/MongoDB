CREATE TABLE IF NOT EXISTS session_count (
    session_count_id SERIAL PRIMARY KEY,
    user_id INT UNIQUE,
    session_count_value INT
);

CREATE OR REPLACE FUNCTION trigger_update_session_count()
RETURNS TRIGGER AS $$
BEGIN
    -- Supprimer l'ancienne entrée si elle existe
    DELETE FROM session_count WHERE user_id = OLD.user_id;

    -- Vérifier si l'utilisateur a au moins une session
    INSERT INTO session_count (user_id, session_count_value)
    SELECT NEW.user_id, COUNT(session_id) FROM sessions WHERE user_id = NEW.user_id
    GROUP BY NEW.user_id
    ON CONFLICT (user_id) DO UPDATE SET session_count_value = EXCLUDED.session_count_value;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM session_count ;