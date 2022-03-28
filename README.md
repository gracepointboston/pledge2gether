# MaxTime - README

Overview: We're all busy people, and needs todo lists to keep track of our busy lives. The problem is - our errands aren't always in the same place, and it takes extra planning to figure in commute times, the best route through all of the places you need to be, traffic, etc. What if there was an app that could figure all of that out for you? And what if it could do more than that - sync to your Google Calendar, adjust how many tasks you can do based on priority / how much time you have to spare today?

## Getting Started

Install the PostGresQL application: https://postgresapp.com/

Install updated latest libpq, openssl, rbenv
```
brew install libpq mariadb openssl rbenv
```

Once all code is checked out, developers need to install Ruby 2.7.1. Here's how to do it with rbenv, if it is available:
```
rbenv install 3.0.1
rbenv global 3.0.1
```

Once ruby is installed, developers need to install PostGresQL, the DB for development environments. If developers are on a mac, they can install PostGresQL by following the instructions at: https://postgresapp.com/, and then running
```
gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config
```

Setting up the database can be done by calling:
```
make server
```
NOTE: This destructively sets up the database by creating a whole new one and filling it with seed data. Running database updates can be done by simply calling:
```
rake db:migrate
```

## Running Tests

The app is currently in development and doesn't have tests enabled yet, but once they are written, tests can be called by running:
```
rspec
```

## Deployment

The app is currently in development and doesn't have a production environment yet, but once it is available, changes can be pushed live with:
```
git co master
git push heroku HEAD
```
