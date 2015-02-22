require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'
require 'metro'

metro = Metro.new

get '/api/stops' do
  json arrivals: metro.arrivals.all
end

get '/api/stops/:id' do
  json arrivals: metro.arrivals.for_stop(params[:id])
end
