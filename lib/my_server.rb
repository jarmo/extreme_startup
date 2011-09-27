require 'rubygems'
require 'sinatra'

set :port, 1337

get '/' do
  #192.168.0.118 - - [27/Sep/2011 21:35:37] "GET /?q=68e6b220:%20what%20is%2014%20plus%2015 HTTP/1.1" 200 2 0.0050
  #192.168.0.118 - - [27/Sep/2011 21:35:47] "GET /?q=6e9a0230:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%20204,%2089,%2066,%20950 HTTP/1.1" 200 82 0.0007
  #127.0.0.1 - - [27/Sep/2011 21:35:51] "GET /?q=c4ae43a0:%20what%20is%2012%20plus%2015 HTTP/1.1" 200 2 0.0010
  #192.168.0.118 - - [27/Sep/2011 21:35:58] "GET /?q=77433f40:%20what%20is%2016%20plus%2010 HTTP/1.1" 200 2 0.0007
  #192.168.0.118 - - [27/Sep/2011 21:36:03] "GET /?q=7a425760:%20what%20is%206%20plus%205 HTTP/1.1" 200 2 0.0009
  #192.168.0.118 - - [27/Sep/2011 21:36:10] "GET /?q=7d73dcb0:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2095,%20462 HTTP/1.1" 200 73 0.0008
  #192.168.0.118 - - [27/Sep/2011 21:36:21] "GET /?q=84bda4a0:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2032,%20967 HTTP/1.1" 200 73 0.0009
  #192.168.0.118 - - [27/Sep/2011 21:36:31] "GET /?q=8ab73f50:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2033,%20618,%20882,%2045 HTTP/1.1" 200 82 0.0007
  #127.0.0.1 - - [27/Sep/2011 21:36:41] "GET /?q=84bda4a0:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2032,%20967 HTTP/1.1" 200 73 0.0032
  #192.168.0.118 - - [27/Sep/2011 21:36:43] "GET /?q=90b0da00:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2051,%20963,%2043,%2068 HTTP/1.1" 200 81 0.0008
  #192.168.0.118 - - [27/Sep/2011 21:36:53] "GET /?q=9809e9d0:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%2094,%2032,%20192,%203 HTTP/1.1" 200 80 0.0009
  
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
