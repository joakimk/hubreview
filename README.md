## About

Wip experimental commit-by-commit codereview app.

To be able to do review on everything when you [integrate commit-by-commit instead of doing feature branches and pull requests](http://thepugautomatic.com/2014/02/code-review/).

The idea is to use github for codereview and keep track of which commits has been reviewed in this app.

**This is a prototype**, the code will be bad and tests missing. Just doing the fastest possible thing.

## How it looks

![how it looks](http://cl.ly/image/1t2O0W0S1w0T/Screen%20Shot%202014-03-01%20at%2011.41.15%20AM.png)

## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku config:set SECRET_KEY_BASE=$(rake secret) AUTH_KEY=$(pwgen -n 50 -1)
    heroku run rake db:migrate

## Setup on github

Add a webhook, set the payload url to https://your-app.herokuapp.com/github?auth_key=your-key, commit to the repo and look at https://your-app.herokuapp.com?auth_key=your-key.

## Running tests

    rake

## Getting production data locally

    heroku addons:add pgbackups
    rake app:reset

## Todo

* Evaluate if this is a good idea and something to keep
  * In that case reimplement the prototyped parts and refactor
* See if a userscript can be used to report reviewed commits.
