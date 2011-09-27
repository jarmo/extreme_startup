require 'rubygems'
require 'sinatra'

set :port, 1337

get '/' do
  case params["q"]
  when /what is your name/
    "Jarmo & Andri (Awesome!)"
  when /what is (\d+) plus (\d+)/
    ($1.to_i + $2.to_i).to_s
  else
    params.inspect
  end
end
