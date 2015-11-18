require 'sinatra'
require 'json'
require './Utils/ResponseUtility.rb'


## Body Parsing

before do
  request.body.rewind

  begin
    @request_payload = JSON.parse request.body.read
  rescue JSON::ParserError => e
    @request_payload = nil
  end
end


## MOCK LOGIN ##

post '/your-api/login' do
  if @request_payload == nil then
    status 400
    return body ''
  end

  email = @request_payload["email"]
  password = @request_payload["password"]

  if (email == "testuser@domain.com" && password == "test")
    load_response("Login", "ValidCredentials")
  else
    load_response("Login", "InvalidCredentials")
  end
end
