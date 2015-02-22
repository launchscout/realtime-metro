require 'metro/arrivals'

RSpec.describe "Arrivals" do
  let(:fixture_file) { File.new("#{__dir__}/fixtures/trip_update") }
  let(:arrivals) { Arrivals.new(fixture_file.read) }

  describe "#for_stop" do
    let(:mad_hyd_arrivals) { arrivals.for_stop("MADHYDi") }

    it "lists the stop's arrivals" do
      expect(mad_hyd_arrivals.size).to eq(1)
      expect(mad_hyd_arrivals.first[:route_id]).to eq("11")
    end
  end
end

