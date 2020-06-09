# README

# Lan management website in Ruby on Rails

Application overview:

* Ruby version 2.5.1
RVM is recommended to keep different versions of ruby. 
  - Ruby on Rails (Rails) 5.2.1
  - MYSQL
  - the gem file has most of the dependencies so running bundle install should install them.

## Setup
### Database creation
 - make sure `database.yml` is correct for your environment.
 - Run `bundle` to make sure all the gems are installed
 - Run `rake db:create` to create the database
 - Run `rake db:migrate` to make all the changes to the database
 - Run `rake db:seed` (for seed data)
 - Run `rails s` (to start the server)
