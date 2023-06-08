# Nashville_Housing

## Table of Contents 
* [Overview](#overview)
* [Aim](#aim)
* [Technologies](#technologies)
* [Data](#data)
* [Copywrite](#copywrite)

## Overview 
In this project we are going to study clean Nashville Housing Data by ding the following:
* Populate Property Address data
* Break out Addresses and Owners Adresses into Individual Columns (Address, City, State)
* Change Y and N to Yes and No in "Sold as Vacant" field
* Identify duplicates by using row_number() and delete them
* Delete Unused Columns

## Aim
 The aim of our study is to use PostgreSql to clean Nashville Housing Data 

## Technologies 
* PostgreSQL 
* PgAdmin 
 

## Data
### Data Source 
The data was imported from <a href="https://github.com/AlexTheAnalyst/PortfolioProjects">Alex The Analyst GitHub</a> 
</br> 
You can download it from <a href="https://github.com/MireyNM/Nashville_Housing/blob/main/static/data/Nashville%20Housing%20Data%20for%20Data%20Cleaning.csv">here</a> as well.

### Data Exploration
Using SQL we wrote few queries to explore the data and build few tables. 
See <a href="https://github.com/MireyNM/Covid_Dashboard/blob/main/coviddeaths.sql">coviddeaths.sql</a> 

After that we have wrote few queries to create tables that we have exported into Excel tables to be used in Tableau. See <a href="https://github.com/MireyNM/Covid_Dashboard/blob/main/create_tables.sql">create_tables.sql</a>

Finally, using Tableau we have built visualizations and dashboard. 
Link to Tableau Dasboard: 
<a href="https://public.tableau.com/app/profile/mireille1519/viz/CovidDashboard_16783200101730/CovidDashboard">CovidDashboard</a>

## Results 
<p align = "center">
<img width="1000" alt="Screen Shot 2023-03-08 at 6 31 53 PM" src="https://user-images.githubusercontent.com/109363759/224436719-2c15b37f-2c93-4af7-b9f4-34dc6975c830.png">
</p>
<p align = "center">
Fig.1 -  Covid Data Dashboard
</p>

Based on our visualization (See Fig. 1), we can conclude:
* The number of total cases, total deaths, and the death percentage.
* The number of total deaths by continents. As we can see Europe had the biggest number of deaths. 
* A map showing the percent of infected by Covid per country. 
* The average percent population infected by date by country. 
 
## Copywrite
This is a guided project done by <a href="https://github.com/AlexTheAnalyst/PortfolioProjects">Alex The Analyst</a> 
</br>
You can check his <a href="https://youtu.be/qfyynHBFOsM">Data Analyst Portfolio Projects</a> on Youtube. 
