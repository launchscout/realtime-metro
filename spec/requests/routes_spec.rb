require 'metro/arrivals'
require 'requests_helper'


RSpec.describe "/routes" do
  let(:json) { JSON.parse(last_response.body) }

  it "lists the routes" do
    get "/api/routes"
    expect(last_response).to be_ok
    expect(json["routes"].first["route_id"]).to eq("1")
  end
end


