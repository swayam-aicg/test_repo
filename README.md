# Polk County Iowa - dbt Project

## Overview
This dbt project transforms raw JMS (Jail Management System) and Courts data for Polk County, Iowa.

## Project Structure

```
├── analyses/           # Ad-hoc analytical queries
├── macros/             # Reusable SQL macros
│   ├── transformations/
│   └── utils/
├── models/
│   ├── staging/        # Raw data staging models
│   ├── intermediate/   # Intermediate transformations
│   └── marts/          # Business-ready data marts
└── profiles.yml        # Connection profiles
```

## Getting Started

1. Install dbt: `pip install dbt-snowflake`
2. Configure your profiles.yml
3. Run `dbt debug` to test connection
4. Run `dbt run` to build models

## Models

### Staging
- `stg_jms__bookings` - Raw booking records
- `stg_jms__charges` - Charge information
- `stg_jms__inmates` - Inmate demographic data
- `stg_courts__cases` - Court case records
- `stg_courts__hearings` - Hearing schedules

### Marts
- `dim_inmates` - Inmate dimension
- `dim_charges` - Charge dimension
- `fct_bookings` - Booking facts
- `fct_daily_population` - Daily jail population

## Contributing
Please create a feature branch and submit a PR for review.
