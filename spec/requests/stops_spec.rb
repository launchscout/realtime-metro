require 'requests_helper'

RSpec.describe "/routes/11/stops" do
  let(:json) { JSON.parse(last_response.body) }

  it "lists all the stops for a given route" do
    get "/api/stops"
    expect(last_response).to be_ok
    expect(json["stops"].first["stop_code"]).to eq("EZZLINe")
  end
end


