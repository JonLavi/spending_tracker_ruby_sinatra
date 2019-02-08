# Spending Tracker

This is a basic spending tracker app. It is a web-app built with Ruby, Sinatra, and SQL, created to practice and consolidate web-programming skills learnt at CodeClan.
It allows the user to set a budget, and log different expenses.

### ToDo:
* Finish the functionality to filter by merchant/tag
* Add CSS styling

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

To run the app, you will require to have the following installed on your machine: Ruby, PostgreSQL, and Sinatra

Install Sinatra and the PG gem to allow Ruby to access PostgreSQL
```
gem install sinatra
gem install pg
```
If you wish to run the tests, you will be required to install minitest
```
gem install minitest
```

### Installing

Once you have all the prerequesits installed:

Create and seed a database

```
createdb spending_tracker
psql -d spending_tracker -f db/spending_tracker.sql
rb db/seeds.rb
```

Run the web-server:

```
ruby app.rb
```

Open the web-view by pointing your favourite browser to:

```
http://localhost:4567
```

You are now free to add/edit/remove entries to the database.

## Running the tests

From the root directory of the project, run the test files:
```
rb models/specs/[test_file_name].rb
```

## Built With

* [Ruby](https://www.ruby-lang.org)
* [PostgreSQL](https://www.postgresql.org)
* [Sinatra](http://sinatrarb.com)

