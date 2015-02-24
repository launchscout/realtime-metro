require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'
require 'sinatra/cross_origin'
require 'metro'

configure do
  enable :cross_origin
end

metro_connection = Metro::Connection.new

get '/api/arrivals' do
  json arrivals: metro_connection.arrivals.all
end

get '/api/arrivals/:stop_id' do
  json arrivals: metro_connection.arrivals.for_stop(params[:stop_id])
end

get '/api/routes' do
  json routes: Metro::Routes.all
end

get '/api/stops' do
  json stops: Metro::Stops.search(params[:name])
end

