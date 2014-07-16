require 'json'

require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'chartkick'
require 'groupdate'

require_relative 'data'

DATA = Data.all

get '/' do
  @data = DATA
  erb :index
end