require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'
require 'rack/cors'
require 'metro'

use Rack::Cors do
  allow do
    origins '*'
    resource '/api/*', headers: :any, methods: :get, max_age: 0
  end
end

metro = Metro.new

get '/api/arrivals' do
  json arrivals: metro.arrivals.all
end

get '/api/arrivals/:stop_id' do
  json arrivals: metro.arrivals.for_stop(params[:stop_id])
end
