# Get started
- Install gems
    - `bundle install –path=vendor/bundle`

- Start local server
    - `bin/server`
        - guard livereload will automatically reload your browser.

- Ruby version
    - 2.4.0 

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

# Deployment instructions
Precompile js css

`bundle exec rails assets:precompile RAILS_ENV=production`

Set up database

`bundle exec rails db:migrate RAILS_ENV=production`

Set .env file 

Cron job for getting xem currency rate 

run `bundle exec whenever` and paste output to cron


## tools
Convert erb to slim
- http://erb2slim.com/
- `for i in app/views/**/*.erb; do erb2slim $i ${i%erb}slim && rm $i; done`

