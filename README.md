## About

Commit-by-commit code review app for github repos. Keeps track of what has been reviewed and links to github commits for the actual review.

This can be used to do code review when you [integrate commit-by-commit instead of doing feature branches and pull requests](http://thepugautomatic.com/2014/02/code-review/).

## How it looks

(when used in combination with Fluid.app to get a github pane on the right)

![how it looks](http://cl.ly/image/1x0W0V2m2c3A/Screen%20Shot%202014-03-07%20at%208.06.08%20PM.png)

## Parameters

* `?open_in_same_page=true` removes the `target="_blank"` from links (useful e.g. if with panels in [Fluid.app](http://fluidapp.com/))

* `?me=Foobar` de-emphasizes commits where the author contains "Foobar" (case-sensitive)

## Use with Fluid.app (on OS X)

With [Fluid.app](http://fluidapp.com/), you can see Hubreview side-by-side with GitHub in two panes.

This is not possible with regular iframes, as GitHub doesn't allow embedding.

* Install [Fluid.app](http://fluidapp.com/).
* Launch Fluid.app, create a new app:
  * The URL should be `http://github.com`.
  * Use any name and icon you like. It defaults to the GitHub icon.
  * Let it launch the app.
* Open your app's preferences and configure it like this:
  * Whitelist:
    * Allow browsing to any URL
  * The first of the two "Browsa" panels:
    * Enter the Hubreview URL as home page, include the `?open_in_same_page=true` parameter.
    * Navigation bar: is always hidden
    * Clicked links open in: current tab in current window
* In the "Panels" menu, select the first Browsa panel to show it


## Heroku

    git remote add heroku git@heroku.com:APP_NAME.git
    heroku config:set SECRET_KEY_BASE=$(rake secret) AUTH_KEY=$(pwgen -n 50 -1)
    heroku run rake db:migrate

    # For websockets to update the view on changes to revisions or new revisions
    heroku labs:enable websockets
    heroku addons:add rediscloud:25

## Setup on github

### Automatic:

  If you're a barsoomian you could use [this](https://github.com/barsoom/servers/wiki/Hubreview-hook)

### Manual:

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

* See if some workflow could be made where you don't have to check email for comments. Maybe as simple as listing your reviewed commits. Better if it can list those with new comments. Mark as checked at a time. Have new stuff make them reappear.

## Credits and license

Contributors:

* [Henrik Nyh](https://github.com/henrik)

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
