CREATE OR REPLACE VIEW subscription_per_plan_per_month AS
SELECT
    EXTRACT (MONTH FROM subscribed_at) AS month,
    subscription_plan,
    SUM(paid) AS total_paid,
    COUNT(*) AS total_subscriptions
FROM
    subscription
WHERE
    subscribed_at BETWEEN '2023-01-01' AND '2023-06-30'
GROUP BY
    EXTRACT(MONTH FROM subscribed_at),
    subscription_plan
ORDER BY month ASC;
    
SELECT* FROM subscription_per_plan_per_month;