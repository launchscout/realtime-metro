require 'byebug'
require 'vendor/gtfs-realtime.pb.rb'

class Arrivals
  def initialize(io)
    @feed = TransitRealtime::FeedMessage.parse(io.read)
  end

  def for_stop(stop)
    trip_updates = @feed.entity.map { |e| e.trip_update }
    trip_updates.map { |tu|
      route_id = tu.trip.route_id
      tu.stop_time_update.map { |stu|
        stu = stu.to_hash
        {
          stop_id: stu.fetch(:stop_id),
          route_id: route_id,
          delay: stu.fetch(:departure, {}).fetch(:delay, nil),
          time: stu.fetch(:departure, {}).fetch(:time, nil),
        }
      }
    }.flatten
  end
end
