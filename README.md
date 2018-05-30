# README



## Application to Jot Down Notes

### Requirements
* Ruby 1.9+ (https://rubyinstaller.org/)
* Bundler (https://bundler.io/)


## cd into the project 

### Databse Setup 

```
Rake db:create db:migrate db:seed
```


### Install & Run

```
bundle install
rails s
```




## How to run the test suite

* cd into app and run 
* run rspec
* view test coverage report in coverage -> index.html

## Preloaded Data to test

### Login with following credentials: 

* email: test_user@example.com, password: "12345678"
* email: test_user_two@example.com password: "87654321"



## Improvements in Future:

* Integrate CKEditor to content body

* Integrate feature to attach media  files to notes ( pdf, photos, videos, embedded videos.)

* Add more user related information.

* Verify user via email confirmation.

* Integrate emails and sms alert.

* Write specs for user behaviour ( UI )

* User Role Based Permission access




## Want to Contribute?

Contact Me at aashish.khullar92@gmail.com
