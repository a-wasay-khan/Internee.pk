SELECT dependents, COUNT(*) AS count_rows
FROM churn_prediction
GROUP BY dependents
ORDER BY count_rows DESC;

UPDATE churn_prediction
SET dependents = NULL
WHERE LTRIM(RTRIM(dependents)) = ''
   OR (ISNUMERIC(dependents) = 1 AND CAST(dependents AS INT) > 2);

ALTER TABLE churn_prediction
ALTER COLUMN dependents VARCHAR(20);

UPDATE churn_prediction
SET dependents = 'Not Specified'
WHERE dependents IS NULL;



