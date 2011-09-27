require 'rubygems'
require 'sinatra'

set :port, 1337

get '/' do
  #192.168.0.118 - - [27/Sep/2011 21:54:24] "GET /?q=0a714870:%20which%20of%20the%20following%20numbers%20is%20both%20a%20square%20and%20a%20cube:%2046656,%20843 HTTP/1.1" 200 89 0.0010
  #192.168.0.118 - - [27/Sep/2011 21:54:34] "GET /?q=10b8d1b0:%20what%20is%2014%20multiplied%20by%209 HTTP/1.1" 200 45 0.0011
  
  case params["q"]
  when /what is your name/
    "Jarmo & Andri (Awesome!)"
  when /what is (\d+) plus (\d+)/
    ($1.to_i + $2.to_i).to_s
  when /which of the following numbers is the largest: (.*)/
    $1.split(",").map {|i| i.to_i}.max.to_s
  else
    params.inspect
  end
end
