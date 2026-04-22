# dbt Modeling Design Rationale

## Overview
This project follows standard dbt analytics engineering best practices with clear
layering and dimensional modeling.

## Model Layers
- **Staging**: Raw Salesforce source data exposed as views. These models are treated
  as immutable inputs.
- **Intermediate**: Models used to standardize column names, clean data, and prepare
  reusable transformations.
- **Marts**: Dimensional models (facts and dimensions) designed for analytics and reporting.

## Modeling Decisions
- Facts and dimensions follow a star schema pattern.
- Surrogate keys are generated using `dbt_utils.generate_surrogate_key` to provide stable joins.
- A reusable date dimension is created using the `dbt_date` package.
- Tags are applied to models to support selective execution.

## Data Quality
- Primary key tests (`unique`, `not_null`) enforce grain correctness.
- Relationship tests ensure referential integrity between facts and dimensions.
- Accepted values tests validate enum fields such as opportunity stage.

