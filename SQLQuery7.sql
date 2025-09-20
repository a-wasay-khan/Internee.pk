SELECT city_codes, COUNT(*) AS count_rows
FROM churn_prediction
GROUP BY city_codes
ORDER BY count_rows DESC;

UPDATE churn_prediction
SET city_codes = 0
WHERE city_codes IS NULL;
