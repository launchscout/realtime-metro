require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'
require 'faraday'
require 'metro'

METRO_ENDPOINT = 'http://developer.go-metro.com'

connection = conn = Faraday.new(url: METRO_ENDPOINT)

get '/api/stops/:id' do
  response = connection.get("/TMGTFSRealTimeWebService/TripUpdate/")
  arrivals = Arrivals.new(response.body)
  json arrivals: arrivals.for_stop(params[:id])
end
