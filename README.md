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
Using PostgreSQL we wrote a <a href="https://github.com/MireyNM/Nashville_Housing/blob/main/codes/create_tabe%3Dle.sql">querry to build the table in PgAdmin.</a>   

After that we have wrote few querries to explore and clean the data. 
See <a href="https://github.com/MireyNM/Nashville_Housing/blob/main/codes/cleaning_data.sql">cleaning_data.sql</a> 

 
## Copywrite
This is a guided project done by <a href="https://github.com/AlexTheAnalyst/PortfolioProjects">Alex The Analyst</a> 
</br>
You can check his <a href="https://youtu.be/qfyynHBFOsM">Data Analyst Portfolio Projects</a> on Youtube. 
One should note that the code writtien here is slightly modified beacuse we have used PostgreSQL. 
