require 'rack/test'
require_relative '../server'

module RSpecMixins
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixins
end
