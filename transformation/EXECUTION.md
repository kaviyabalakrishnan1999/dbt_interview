# How to Run the Project

This project is designed to run using the provided VS Code Dev Container
with an embedded DuckDB database and no cloud credentials.

Steps:
1. Open the repository in VS Code
2. Reopen in Dev Container
3. From the transformation directory, run:

dbt build

This command builds all models and runs all schema tests.
