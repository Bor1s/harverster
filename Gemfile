# A sample Gemfile
source "https://rubygems.org"

gem 'sinatra'
gem 'sinatra-contrib'
gem 'moped', github: 'mongoid/moped'
gem 'mongoid', github: 'mongoid/mongoid'

group :test do
  gem 'rspec'
end

group :development do
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano-bundler', '~> 1.1.2'
end

group :production do
  gem 'unicorn'
  gem 'capistrano'
  gem 'capistrano-rbenv'
end
