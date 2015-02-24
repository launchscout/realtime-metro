require 'metro/stops'

module Metro
  RSpec.describe Stops do
    describe '.all' do
      it 'returns all the stops' do
        expect(Stops.all.length).to eq(4465)
      end
    end
  end
end
