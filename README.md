# Online Retail Sales Analysis

A SQL-based database project for analyzing online retail sales performance using transactional data.

## About

This project was developed as the final project for CS50's Introduction to Databases with SQL.

The project uses the Online Retail dataset from the UCI Machine Learning Repository and focuses on analyzing:

- Revenue
- Sales volume
- Product performance
- Customer performance
- Country performance
- Cancellation and return activity

## Database Design

The database consists of four main entities:

- Customer
- Product
- Invoice
- InvoiceLine

![ER Diagram](diagram.png)

The complete database design, relationships, functional requirements, optimizations, and limitations are documented in [`DESIGN.md`](DESIGN.md).

## SQL Analysis

The project contains SQL queries for:

- Revenue analysis
- Monthly sales performance
- Product performance
- Customer performance
- Country performance
- Cancellation and return analysis

See [`queries.sql`](queries.sql) for the complete SQL analysis.

## Technologies

- SQLite
- SQL
- DBeaver

## Project Files

| File | Description |
|---|---|
| `schema.sql` | Database schema and relationships |
| `queries.sql` | SQL analysis queries |
| `DESIGN.md` | Detailed CS50 SQL design document |
| `diagram.png` | Entity Relationship Diagram |

## Project Presentation

[Watch the project presentation](https://youtu.be/0rImmfNehl8)

## Certificate

[Completed CS50's Introduction to Databases with SQL]([url](https://certificates.cs50.io/7f0dcbc7-8992-4a24-b6f9-beb77ce59c95.pdf?size=letter)).
