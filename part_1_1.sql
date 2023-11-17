CREATE TABLE IF NOT EXISTS user_table (
    user_id serial PRIMARY KEY,
    firstname character varying,
    lastname character varying,
    email character varying UNIQUE,
    username character varying CHECK (LENGTH(username) > 8) UNIQUE,
    password character varying CHECK (LENGTH(password) > 8),
    created_at DATE
);

CREATE TABLE IF NOT EXISTS user_email_verification (
    uev_id serial PRIMARY KEY,
    user_id smallint,
    verified_at DATE
);

CREATE TABLE IF NOT EXISTS session_table (
    session_id serial PRIMARY KEY,
    user_id smallint,
    connected_at DATE
);