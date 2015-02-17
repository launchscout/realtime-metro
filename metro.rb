require 'rubygems'
require 'bundler/setup'
require 'byebug'

require 'http'
require_relative './gtfs-realtime.pb'

TRIP_ENDPOINT = 'http://developer.go-metro.com/TMGTFSRealTimeWebService/TripUpdate/'
VEHICLE_ENPOINT = 'http://developer.go-metro.com/TMGTFSRealTimeWebService/vehicle'

STOP = 'MADHYDi'

data = HTTP.get(TRIP_ENDPOINT).to_s
trip_update_messages = TransitRealtime::FeedMessage.parse(data)

