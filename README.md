## About

Wip experimental commit-by-commit codereview app.

**This is a prototype**, the code will be bad. Just doing the fastest possible thing.

## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku config:set SECRET_KEY_BASE=$(rake secret) AUTH_KEY=$(pwgen -n 50 -1)
    heroku run rake db:migrate

## Getting production data locally

    heroku addons:add pgbackups
    rake app:reset
