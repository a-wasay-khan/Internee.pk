SELECT 
    SUM(CASE WHEN current_balance IS NULL THEN 1 ELSE 0 END) AS null_current_balance,
    SUM(CASE WHEN previous_month_end_balance IS NULL THEN 1 ELSE 0 END) AS null_prev_month_end,
    SUM(CASE WHEN average_monthly_balance_prevQ2 IS NULL THEN 1 ELSE 0 END) AS null_avg_bal_Q2,
    SUM(CASE WHEN previous_month_debit IS NULL THEN 1 ELSE 0 END) AS null_prev_debit,
    SUM(CASE WHEN previous_month_balance IS NULL THEN 1 ELSE 0 END) AS null_prev_balance,
    SUM(CASE WHEN current_month_balance IS NULL THEN 1 ELSE 0 END) AS null_current_month
FROM churn_prediction;


UPDATE churn_prediction
SET 
    current_balance = COALESCE(current_balance, 0),
    previous_month_end_balance = COALESCE(previous_month_end_balance, 0),
    average_monthly_balance_prevQ2 = COALESCE(average_monthly_balance_prevQ2, 0),
    previous_month_debit = COALESCE(previous_month_debit, 0),
    previous_month_balance = COALESCE(previous_month_balance, 0),
    current_month_balance = COALESCE(current_month_balance, 0);
