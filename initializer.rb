require 'mongoid'
require 'sinatra'
require 'sinatra/json'

ENV['MONGOID_ENV'] = ENV['RACK_ENV'] || 'development'
Mongoid.load!('./config/mongoid.yml')
Dir.glob(File.join('./app/models','*.rb')).each {|f| require f}
Dir.glob(File.join('./app/services','*.rb')).each {|f| require f}
Dir.glob(File.join('./app/api','*.rb')).each {|f| require f}
