# dbt Modeling Design Rationale

## Overview
This project demonstrates core dbt analytics engineering best practices using
a clear, layered approach and simple dimensional modeling on top of Salesforce data.
The focus is on structure, clarity, and correctness rather than business-specific logic.

## Model Layers
- **Staging**  
  Source-aligned views on raw Salesforce data (provided as part of the starter project).
  These models are treated as immutable inputs and are not modified.

- **Intermediate**  
  Lightweight transformation models used to clean data, standardize column names,
  and prepare reusable transformations for downstream models.

- **Marts**  
  Dimensional models (fact and dimension tables) designed for analytics and reporting.
  These models follow a simple star schema pattern.

## Modeling Decisions
- Fact and dimension models follow a star schema design.
- Each model has a clearly defined grain documented in SQL comments.
- Surrogate keys are generated using `dbt_utils.generate_surrogate_key` to create
  stable joins between facts and dimensions.
- A reusable date dimension is included using the `dbt_date` package as a standard
  analytics pattern.
- The scope is intentionally kept small (one main fact and dimensions) to keep the
  logic easy to understand and review.

## Data Quality
- Primary keys are tested using `not_null` and `unique` tests to enforce grain correctness.
- Relationship tests ensure referential integrity between fact and dimension models.
- Accepted values tests are used for enum-type fields such as opportunity stage.

## Notes
The goal of this assignment is to demonstrate strong dbt fundamentals—project structure,
model dependencies, testing, and clarity—rather than perfect business logic or exhaustive
feature usage.
