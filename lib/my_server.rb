require 'rubygems'
require 'sinatra'

set :port, 1337

get '/' do
  case params["q"]
  when /what is your name/
    "Jarmo & Andri (Awesome!)"
  when /what is (\d+) plus (\d+)/
    ($1.to_i + $2.to_i).to_s
  when /which of the following numbers is the largest: (.*)/
    $1.split(",").map {|i| i.to_i}.max.to_s
  when /which of the following numbers is both a square and a cube: (\d+), (\d+)/
    x = $1.to_i
    y = $2.to_i
    x == x*x && x == x*x*x && x.to_s || y == y*y && y == y*y*y && y.to_s
  when /what is (\d+) multiplied by (\d+)/
    ($1.to_i * $2.to_i).to_s
  else
    require 'net/http'
    require 'uri'
    
    answer = ""
    urls = %w[
      http://192.168.0.123:12345
      http://195.222.1.250:9000 
      http://192.168.0.124
      http://192.168.0.147
    ].each do |url|
      uri = URI.parse(URI.encode(url + "/?q=" + params["q"]))
      answer = Net::HTTP.get(uri)
      break unless answer.strip.empty?
    end
    
    p answer
    answer
  end
end
