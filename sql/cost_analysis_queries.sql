-- Cloud Cost Optimization / FinOps Case Study
-- SQL examples for analyzing synthetic AWS spend data.
-- Assumes the CSV has been cataloged as a table named cloud_spend_sample.

-- 1. View all spend records
SELECT *
FROM cloud_spend_sample
LIMIT 25;

-- 2. Monthly cost by AWS service
SELECT
    month,
    service,
    SUM(monthly_cost) AS total_monthly_cost
FROM cloud_spend_sample
GROUP BY month, service
ORDER BY month, total_monthly_cost DESC;

-- 3. Highest-cost resources
SELECT
    month,
    service,
    resource_id,
    environment,
    owner_team,
    monthly_cost,
    utilization_percent,
    optimization_signal
FROM cloud_spend_sample
ORDER BY monthly_cost DESC;

-- 4. Estimated savings by recommended action
SELECT
    recommended_action,
    COUNT(*) AS affected_resources,
    SUM(monthly_cost) AS current_monthly_cost,
    SUM(estimated_monthly_savings) AS estimated_monthly_savings
FROM cloud_spend_sample
GROUP BY recommended_action
ORDER BY estimated_monthly_savings DESC;

-- 5. Underutilized or idle compute resources
SELECT
    month,
    resource_id,
    environment,
    owner_team,
    usage_amount,
    monthly_cost,
    utilization_percent,
    recommended_action,
    estimated_monthly_savings
FROM cloud_spend_sample
WHERE service = 'EC2'
  AND utilization_percent < 20
ORDER BY estimated_monthly_savings DESC;

-- 6. Production resources requiring monitor-only treatment
SELECT
    month,
    service,
    resource_id,
    environment,
    monthly_cost,
    utilization_percent,
    optimization_signal,
    recommended_action
FROM cloud_spend_sample
WHERE environment = 'production'
  AND recommended_action = 'Monitor only'
ORDER BY monthly_cost DESC;

-- 7. Total estimated savings by month
SELECT
    month,
    SUM(monthly_cost) AS total_monthly_cost,
    SUM(estimated_monthly_savings) AS total_estimated_savings,
    ROUND(
        SUM(estimated_monthly_savings) / NULLIF(SUM(monthly_cost), 0) * 100,
        2
    ) AS estimated_savings_percent
FROM cloud_spend_sample
GROUP BY month
ORDER BY month;

-- 8. Cost optimization candidates by priority
SELECT
    month,
    service,
    resource_id,
    monthly_cost,
    estimated_monthly_savings,
    ROUND(
        estimated_monthly_savings / NULLIF(monthly_cost, 0) * 100,
        2
    ) AS savings_opportunity_percent,
    recommended_action
FROM cloud_spend_sample
WHERE estimated_monthly_savings > 0
ORDER BY estimated_monthly_savings DESC;
