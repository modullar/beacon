# Contributing Code to Beacon
All contributions, including pull requests, issues, and comments, are governed by our [code of conduct](https://github.com/ContributorCovenant/beacon/blob/release/CODE_OF_CONDUCT.md).

## Adding gems
If you are adding a new gem, be sure to place it in the proper section of the `GEMFILE` in alphabetical order.

## Passing specs
Make sure there are no test failures:

`bundle exec rspec spec/`

## Coding style
Make sure there are no code style violations:

`bundle exec rubocop`

## Security
Make sure that you have not introduced a security vulnerability:

`bundle exec brakeman`


# Local setup (non-Docker)

* Set up your environment variables for local development

`cp .env.development.sample .env.development`

* Install gems

`bundle`

* Create the database

`bundle exec rake db:create:all`

* Migrate the database

`bundle exec rake db:migrate`

* Seed the database

`bundle exec rake db:seed`

* Start the application

`rails s`

* Visit [http://localhost:3000](http://localhost:3000) in your browser

# Developing in a dockerized environment

## Setup

Set the following values in `.env.development`

    - DATABASE_HOST=db
    - DATABASE_USERNAME=postgres
    - DATABASE_PASSWORD=postgres

* run `make setup`

## Updating dependencies

After changing the gemfile, you can either run

`make update-deps` OR `make dev` then `bundle install`

## Migrating the database schema

After adding the migration, you can either run

`make db-migrate` OR `make dev` then `rake db:migrate`

## Adding seed data

`make dev` then `rake db:seed`

## Running the specs

`make rspec` OR `make dev` then `rspec`

## Running locally in a container

Use the command `make run` and visit [http://localhost:3000/](http://localhost:3000/)
