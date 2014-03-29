require 'spec_helper'

describe 'Game REST API' do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  before :all do
    Subscription.create(game_id: '1')
    Subscription.create(game_id: '1')
    Subscription.create(game_id: '2')
    Subscription.create(game_id: '2')
    Subscription.create(game_id: '2')
  end

  after :all do
    Subscription.destroy_all
  end

  it 'fetches the top' do
    get '/games/top'
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to eq [{'game' => '2', 'amount' => 3.0},{'game' => '1', 'amount' => 2.0}]
  end
end
