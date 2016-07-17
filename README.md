RoR netguru training
================
[![Build Status](https://travis-ci.org/ouykjh/netguru_app.svg?branch=master)](https://travis-ci.org/ouykjh/netguru_app)

### :hash: App description
-------------
Simple application for managing school subjects, teaching staff and students.
------

#### What is done:

* all tests should pass - done
* connect Travis CI to your repo, add badge and ensure your application has "build | passing status" - done 
* deploy your application to Heroku - done
* add `birthdate` column to `Student` model - done
* add a function that allows storing data about student payments in the database - done, but:
  * according to: [Turbolinks](http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper) I didn't resolve problem with full reloading page. So if you click `Payments` link at navigation bar it doesn't work correctly (you need to refresh page and it works). What's more there is some issue with month selection script in this application so I did it in very ugly way - there is a column with months and you can filter it by `Search` field  or by dropdown (I'm not 100% sure if I understand this functionality)
* prepare seeds - done (However the easiest way is change scope of gem `Faker` to be also applied on production)  

