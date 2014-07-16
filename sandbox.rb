require_relative 'data'

require 'rubygems'
require 'bundler/setup'

require 'pry'

data = Data.all

binding.pry
