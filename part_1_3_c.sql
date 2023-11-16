CREATE OR REPLACE VIEW very_active_users_may  AS
    WITH SessionsEnMai AS (
        SELECT
            u.user_id,
            COUNT(s.session_id) AS mai_session
        FROM
            user_table u
        JOIN
            session_table s ON u.user_id = s.user_id
        WHERE
            EXTRACT(MONTH FROM connected_at) = 5
        GROUP BY
            u.user_id, u.username
    )
    SELECT
        u.username
    FROM
        user_table u
    JOIN
        SessionsEnMai s ON u.user_id = s.user_id
    WHERE
        s.mai_session > 0.6 * (SELECT AVG(mai_session) FROM SessionsEnMai);
        
SELECT * FROM very_active_users_may  ;