require 'rubygems'
require 'sinatra'

class MyServer < Sinatra::Base
  set :port, 1337

  get '/' do
    "johannes"
  end
end
