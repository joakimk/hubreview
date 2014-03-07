## About

Wip commit-by-commit codereview app.

To be able to do review on everything when you [integrate commit-by-commit instead of doing feature branches and pull requests](http://thepugautomatic.com/2014/02/code-review/).

The idea is to use github for codereview and keep track of which commits has been reviewed in this app.

## How it looks

(when used in combination with Fluid.app to get a github pane on the right)

![how it looks](http://cl.ly/image/080p2y3T3b22/Screen%20Shot%202014-03-06%20at%207.56.07%20PM.png)

## Parameters

* `?open_in_same_page=true` removes the `target="_blank"` from links (useful e.g. if with panels in [Fluid.app](http://fluidapp.com/))

* `?me=Foobar` de-emphasizes commits where the author contains "Foobar" (case-sensitive)

## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku config:set SECRET_KEY_BASE=$(rake secret) AUTH_KEY=$(pwgen -n 50 -1)
    heroku run rake db:migrate

    # For websockets to update the view on changes to revisions or new revisions
    heroku labs:enable websockets
    heroku addons:add rediscloud:25

## Setup on github

Add a webhook, set the payload url to https://your-app.herokuapp.com/github?auth_key=your-key, commit to the repo and look at https://your-app.herokuapp.com?auth_key=your-key.

## Running tests

    # OSX: brew install phantomjs
    rake db:create db:migrate db:schema:load
    rake

## Running locally

May error out on some loads due to web sockets.

    rake db:setup
    PORT=3000 foreman start
    open http://localhost:3000

When you run `rake db:setup`, you get some example seed data.

If that's not enough, you can download production data.

## Getting production data locally

    heroku addons:add pgbackups
    rake app:reset

## Todo

* See if a userscript can be used to report reviewed commits.
* Fetch comment info somehow. Display which of your commits have comments. Be able to mark as read up to some time.
  * Not needing to check email for review comments.
* Evaluate "idea for hubreview: have the favicon change to show the number of unreviewed things"
* Github auth to see who is reviewing.
* Various filters or search
* Showing CI status
* For some unknown reason setupLinkOpening() can't be triggered during page load on heroku. Set it to run on all websocket updates for now.

## Credits and license

By Joakim Kolsjö under the MIT license:

>  Copyright (c) 2014 Joakim Kolsjö
>
>  Permission is hereby granted, free of charge, to any person obtaining a copy
>  of this software and associated documentation files (the "Software"), to deal
>  in the Software without restriction, including without limitation the rights
>  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>  copies of the Software, and to permit persons to whom the Software is
>  furnished to do so, subject to the following conditions:
>
>  The above copyright notice and this permission notice shall be included in
>  all copies or substantial portions of the Software.
>
>  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>  THE SOFTWARE.
