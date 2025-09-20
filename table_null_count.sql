use Projects;

DECLARE @table_name NVARCHAR(128) = 'churn_prediction';
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = STRING_AGG(
    'SUM(CASE WHEN ' + QUOTENAME(c.name) + ' IS NULL THEN 1 ELSE 0 END) AS null_' + c.name,
    ', ' + CHAR(13) + CHAR(10)
)
FROM sys.columns c
WHERE c.object_id = OBJECT_ID(@table_name);

SET @sql = 'SELECT COUNT(*) AS total_rows, ' + @sql + ' FROM ' + QUOTENAME(@table_name);

EXEC sp_executesql @sql;
