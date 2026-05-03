# Executive Summary

## Overview

This case study reviews synthetic AWS cloud spend for a healthcare-adjacent environment. The goal is to identify avoidable cost, recommend practical optimization actions, and explain the tradeoffs between savings, reliability, security, and operational visibility.

The analysis focuses on common AWS cost areas:

- EC2 compute
- Amazon S3 storage
- Amazon CloudWatch logging
- Amazon Athena query usage
- NAT Gateway data processing
- RDS reporting workload

## Key Findings

The sample data shows several cost optimization opportunities:

1. Non-production EC2 instances are running full monthly hours with low utilization.
2. Raw S3 storage is growing and may benefit from lifecycle policies.
3. CloudWatch log ingestion and retention should be reviewed.
4. Athena query costs can be reduced by improving data layout and query efficiency.
5. NAT Gateway data processing should be reviewed for private network traffic patterns.

## Recommended Actions

### 1. Schedule or right-size non-production EC2

Development and test instances should not run continuously unless required. Scheduling or right-sizing these resources can reduce monthly compute waste while protecting production workloads.

### 2. Apply S3 lifecycle policies

Older raw data should be reviewed for transition to lower-cost storage classes based on access needs, audit requirements, and retrieval expectations.

### 3. Review CloudWatch log retention

Log retention should be matched to business and operational needs. High-value production and security logs may need longer retention, while debug or non-production logs may not.

### 4. Reduce Athena scan volume

Athena costs can be reduced by partitioning data, converting CSV to Parquet, and avoiding broad recurring queries that scan unnecessary data.

### 5. Review NAT Gateway traffic

Private subnet traffic should be reviewed to determine whether VPC endpoints or traffic-path changes could reduce NAT Gateway processing costs.

## Business Impact

The highest-value savings opportunities come from actions that reduce waste without weakening production reliability:

- Scheduling non-production compute
- Reducing unnecessary log retention
- Improving analytics query efficiency
- Applying storage lifecycle controls
- Reviewing recurring network data processing costs

These changes improve cost discipline while preserving cloud value.

## Risk and Tradeoff Considerations

Cost optimization should not be treated as blind cost cutting. Each recommendation must be reviewed against operational risk.

Key tradeoffs include:

- Stopping non-production compute may affect development or testing workflows.
- Lower-cost S3 storage classes may introduce retrieval fees or access delays.
- Shorter log retention may reduce troubleshooting or audit visibility.
- VPC endpoints may reduce NAT traffic but add configuration complexity.
- Data partitioning and Parquet conversion require upfront engineering effort.

## Final Recommendation

Start with low-risk, high-ROI actions:

1. Schedule or right-size non-production EC2.
2. Review CloudWatch log retention.
3. Improve Athena query efficiency.
4. Apply S3 lifecycle policies.
5. Review NAT Gateway traffic for endpoint opportunities.

This order targets avoidable waste first while protecting production reliability, security, and operational visibility.

## Interview Explanation

This case study demonstrates how I approach cloud cost optimization as a decision process. I would first identify major cost drivers, separate production-critical spend from avoidable waste, estimate potential savings, and document tradeoffs before recommending changes. The goal is to reduce unnecessary spend while preserving business value, system reliability, and operational control.
