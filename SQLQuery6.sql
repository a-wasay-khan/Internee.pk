SELECT occupation, COUNT(*) AS count_rows
FROM churn_prediction
GROUP BY occupation
ORDER BY count_rows DESC;

UPDATE churn_prediction
SET occupation = 'Unemployed'
WHERE occupation IS NULL;
