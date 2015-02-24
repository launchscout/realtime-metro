require 'csv'

module Metro
  class Stops
    def self.all
      csv = CSV.read "spec/fixtures/stops.txt", headers: true
      csv.map { |line| line.to_hash }
    end
  end
end
