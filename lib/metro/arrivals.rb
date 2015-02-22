require 'vendor/gtfs-realtime.pb.rb'

class Arrivals
  def initialize(buffer)
    @feed = TransitRealtime::FeedMessage.parse(buffer)
  end

  def for_stop(stop_id)
    all_arrivals.select { |a| a[:stop_id] == stop_id }
  end

  private

  def all_arrivals
    @all_arrivals ||= trip_updates.map { |tu| tu.arrivals }.flatten
  end

  def trip_updates
    @trip_updates ||= @feed.entity.map { |e| TripUpdate.new(e.trip_update) }
  end

  class TripUpdate
    def initialize(options)
      @route_id = options.trip.route_id
      @stop_time_updates = options.stop_time_update
    end

    def arrivals
      @arrivals ||= @stop_time_updates.map { |stu| stu.to_hash.merge(route_id: @route_id) }
    end
  end
end

