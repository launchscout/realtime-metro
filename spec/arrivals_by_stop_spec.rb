require 'metro/arrivals'

RSpec.describe 'showing arrivals by stop id' do
  it 'sends a serialized set of stops' do
    f = File.new("#{__dir__}/fixtures/trip_update")
    arrivals = Arrivals.new(f)
    mad_hyd_arrivals = arrivals.for_stop('MADHYDi')

    expect(mad_hyd_arrivals.first).to eq({stop_id: "PRENOTi", delay: 300, time: 1424126251, :route_id=>"64"})
  end
end
