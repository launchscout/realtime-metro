require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'
require 'sinatra/cross_origin'
require 'metro'

configure do
  enable :cross_origin
end

metro = Metro.new

get '/api/arrivals' do
  json arrivals: metro.arrivals.all
end

get '/api/arrivals/:stop_id' do
  json arrivals: metro.arrivals.for_stop(params[:stop_id])
end
