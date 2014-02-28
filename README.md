## About

Wip experimental commit-by-commit codereview app.

## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku run rake db:migrate
    heroku config:set SECRET_KEY_BASE=$(rake secret)
