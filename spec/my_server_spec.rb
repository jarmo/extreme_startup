require "rack/test"
require File.dirname(__FILE__) + '/../lib/my_server'

describe "MyServer" do
  include Rack::Test::Methods

  it "shows 'johannes' text on main page" do
    get '/'
    last_response.body.should == "johannes"
  end

  def app
    Sinatra::Application
  end
end
