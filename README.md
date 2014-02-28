## About

Wip experimental commit-by-commit codereview app.

## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku config:set SECRET_KEY_BASE=$(rake secret)
    heroku config:set AUTH_KEY=$(pwgen -n 50 -1)
    heroku run rake db:migrate
