Module 1 Final Project: Yay! Swim Meet!
=======================================

## Objectives

Users will be able to use Command Line Interface (CLI) to run our program. 

We will be using: 
- Ruby
- Command Line Interface (CLI)
- Object Orientations
- Relationships Between Models via Active Record Associations

---

## Overview

Welcome coaches and students to our newly created program! This program will allow you to:
- Create your own account with your role (You can skip this part if you have already created)
- Create and find swim meets
- Find coaches/students
- Check out all the swim meets 
- Check out the numbers of coaches, students and swim meets
- Update your info (and delete, IF YOU REALLY HAVE TO)

---

## Setup

Fork it and then clone this repository from github to begin.

After finishing up, run 
1. `git add .`  
2. `git commit -m 'some message'` 
3. `git push` 
for pushing the code changes to github.

## Installation

- Run `bundle install` in the terminal to install all the gems required for this program.

- TTY-Prompt is a great gem that helps in gathering inputs and displaying information beautifully, created by Piotr Murach. In order to activate `TTY::Prompt` for the CLI, you can find `gem "tty-prompt"` in the 
`Gemfile` and then run `bundle` in the terminal to install the gem.

OPTIONAL:
- For readbility in the terminal, you can find `gem "awesome_print"` in the `Gemfile` and then run `bundle install` in the terminal.

## Formats

The format of the table is inside the `db/schema.rb`, migrated from `db/migrate/ALL_THE_TABLES_COLUMN_FORMATION`.

In the `lib` directory, there are 3 models, including: `coach.rb`, `student.rb`, `swim_meet.rb`. 

`swim_meet.rb` is our join model between coach and student. 

### Relationships:
- A Swim Meet belongs to a student.
- A Swim Meet belongs to a coach.

- A Coach has many swim meets.
- A Coach has many students, **THROUGH** swim meets.

- A Student has many swim meets.
- A Student has many coaches, **THROUGH** swim meets.

## Run our program

Run `rake db:seed` to ensure the most updated data stored in database. 

Run the `db/seeds.rb` file with `rake console` from the terminal to interact with the database.

Run the program with `ruby bin/run.rb` from the terminal to activate the CLI.
Please follow the instructions on the terminal to take you whereever you would like to be.

Our goal of this program is to make this simple and user-friendly as we can, and be able to give you information that you are looking for. 


Contributors: 
Arpita and Megan
Sep 2020
