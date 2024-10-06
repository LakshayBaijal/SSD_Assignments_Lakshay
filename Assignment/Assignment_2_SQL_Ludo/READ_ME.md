# SSD Assignment 2
# Lakshay Baijal 2024202006 


# Q1 SQL Stored Procedure

# Important

I need to modify dataset so that i could populate it in MySQL Workbench. I have attached CSV Files in ./CSV Files folder the modified CSV File and also included Exported CSV of every
Query Code.

## Each procedure corresponds to a specific question and performs operations on the Person table or generates reports based on it.

## Table of Contents

### Q1a: Update Hike 2024

### Q1b: Update Person Joining

### Q1c: Update Person Transfer

### Q1d: Generate Employee Region Report

## Q1a:

Create a stored procedure updateHike2024 that calculates the new salary hike for employees weighing less than 55 kg. The new hike is 12% more than their last hike, and the new salary is calculated accordingly.

Description

Updates the hike2024 table with employees' new hike percentages and salaries.
Considers only employees weighing less than 55 kg.
Calculates the new hike by adding 12% to their last hike.
Determines the new salary based on the updated hike percentage.

## Q1b: 

Create a stored procedure UpdatePersonJoining that generates a PersonJoining table with additional details about employees' joining dates and work experience.

Description

Creates the PersonJoining table containing joining date details and work experience.
Extracts day, month name, and year from the joining date.
Calculates work experience in days and years using the current date.
Aids in analyzing employee tenure and joining patterns.

## Q1c:

Create a stored procedure UpdatePersonTransfer to identify employees eligible for transfer based on their gender and tenure.

Description

Populates the PersonTransfer table with eligible employees.
Female employees with more than 10 years of service are assigned to the 'DC' region.
Male employees with more than 20 years of service are assigned to the 'Capitol' region.
Utilizes the date of joining to calculate tenure for transfer eligibility.

## Q1d: 

Create a stored procedure GenerateEmployeeRegionReport that generates a report of the number of employees born in specific time intervals, grouped by their region.

Description

Generates a report showing employee counts born during different time intervals.
Time intervals include:
Between 00:00 and 09:00
Between 09:01 and 16:00
After 16:01
Groups the data by employee region.
Useful for understanding the distribution of birth times among employees in different regions.




# Q2 Pachisi board game
## Overview

This project implements a 3D Pachisi board game board using **Three.js**, where players can roll two dice. Clicking on either dice rolls both dice together, and the results are logged to a file on the server (`logs.txt`). This project combines client-side rendering using Three.js and server-side logging using Node.js.


## Features

- **3D Pachisi board game Board**: Created using Three.js.
- **Two Dice**: Both dice roll simultaneously when clicked.
- **User Interaction**: Players can rotate, zoom, and interact with the 3D scene using mouse controls.

### Install Node.js and Dependencies

Ensure you have Node.js installed on your system.

Once Node.js is installed, initialize a Node.js project in your project directory:

## Setup Instructions

### Step 1: Set Up the Project

Ensure you have the required files, including the Ludo board model (`3d_ludo_king_game.glb`) and the dice images (`Dice1.png`, `Dice2.png`, etc.) in the `model/` directory.

### Step 2: npm init -y

### Step 3: npm install express

### How it Works

- The 3D Ludo board is rendered using Three.js and loaded from a GLB model file (`3d_ludo_king_game.glb`).
- Two dice are displayed as clickable images, and both dice roll together when either one is clicked.
- The dice results are randomly generated and displayed using preloaded dice images.

### How to run

- node server.js


# Q3 Pachisi board game

Similar to Q2
- **Logging**: Dice roll results are saved to a `logs.txt` file on the server, ensuring persistence across sessions.
- Every Dice change it will write that in game.
