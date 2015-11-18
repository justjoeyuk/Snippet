require 'sinatra'
require 'json'
require './Utils/ResponseUtility.rb'


## Body Parsing

before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end


## MOCK LOGIN ##

post '/your-api/login' do
  email = @request_payload["email"]
  password = @request_payload["password"]

  if (email == "testuser@domain.com" && password == "test")
    load_response("Login", "ValidCredentials")
  else
    load_response("Login", "InvalidCredentials")
  end
end
