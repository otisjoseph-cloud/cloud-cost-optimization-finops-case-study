# Cloud Cost Optimization / FinOps Case Study

## Overview

This repository presents a cloud cost optimization case study using synthetic AWS spend data. The project demonstrates how cloud usage can be reviewed, categorized, and translated into cost-aware recommendations.

The goal is to show practical FinOps thinking: identifying cost drivers, separating high-value usage from waste, recommending optimization actions, and explaining tradeoffs in a business-friendly way.

This project uses sample data only. No real company, customer, patient, member, provider, payment, or billing data is included.

## Scenario

A healthcare-adjacent cloud environment has growing AWS spend across compute, storage, monitoring, and analytics services. The organization wants to understand where cost is increasing and which optimization actions can reduce waste without weakening availability, security, or operational visibility.

## Focus Areas

- AWS cloud cost analysis
- FinOps decision-making
- EC2 right-sizing
- S3 storage lifecycle planning
- CloudWatch log retention review
- Athena query cost awareness
- Business and technical tradeoff analysis

## Repository Structure

- `sample-data/cloud_spend_sample.csv` - Synthetic AWS spend dataset
- `sql/cost_analysis_queries.sql` - SQL examples for cost analysis
- `docs/recommendations.md` - Optimization recommendations and tradeoffs
- `docs/executive-summary.md` - Business-facing summary of findings
- `README.md` - Project overview and documentation

## Key Questions

This case study answers:

- Which services are driving the highest monthly cost?
- Which resources show signs of waste or underutilization?
- Which optimization actions offer the strongest ROI?
- Where should cost savings not compromise reliability or visibility?
- How can recommendations be explained to both technical and business stakeholders?

## Expected Recommendations

Potential recommendations include:

- Right-size or stop underutilized EC2 instances
- Apply S3 lifecycle policies for older data
- Review CloudWatch log retention periods
- Reduce unnecessary NAT Gateway data processing where appropriate
- Partition data to reduce Athena scan costs
- Monitor recurring spend patterns through budget alerts and cost reports

## Interview Explanation

This project demonstrates how I connect cloud architecture decisions to business value. I reviewed sample AWS spend, identified likely cost drivers, and documented optimization recommendations while considering reliability, security, monitoring, and operational tradeoffs. The purpose is not just to reduce cost, but to make cost-aware decisions that preserve the value of the cloud environment.

## Author

Otis Joseph  
AWS Certified Solutions Architect - Associate  
AWS Certified Cloud Practitioner  
AWS Certified AI Practitioner
