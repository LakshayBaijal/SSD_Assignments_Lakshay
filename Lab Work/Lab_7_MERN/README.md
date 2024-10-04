#Lakshay Baijal SSD

#2024202006 Lab 7

##README.md

##Project Overview

#Install using -
##NPM install
##in both client and server directory

This project is a MERN Stack web application for managing To-Do tasks and handling student queries. It consists of two main pages:

To-Do Page: Allows users to create To-Do items with title, description, and a completion date.

Overview of the files created and updated as part of the implementation process.

Files Created & Updated

Client Side (React)

# To-Do Page

## File Created: client/src/components/ToDoPage.js

Description: This component provides the interface for creating To-Do items. It includes fields for the title, description, and a date picker for selecting a completion date.

Key Features:

Title, description input fields.

Date picker restricted to future dates.

Create button that displays an alert with the entered information.

Query Page

## File Updated: client/src/components/Query.js

Description: This component allows students to submit a query related to exams and coursework.

Changes Made:
Added a button to navigate to the To-Do Page (/todo).

Added functions to handle redirection to the To-Do Page.
Kept existing query fields, including exam name, course name, question number, and TA's name.
Navigation Update

File Updated: client/src/components/LoginForm.js
Description: Updated the navigation logic for successful login.

Changes Made:
Added redirection to the To-Do Page after a successful login for specific roles.


