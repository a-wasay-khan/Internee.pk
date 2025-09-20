-- Check duplicates (based on customer_id)
SELECT customer_id, COUNT(*)
FROM churn_prediction
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Remove duplicates (keeping first occurrence)
DELETE FROM churn_prediction
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM churn_prediction
    GROUP BY customer_id
);
