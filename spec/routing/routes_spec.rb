require 'rails_helper'

describe 'routes', :type => :routing do
  it 'routes GET /' do
    expect(root_path).to eq '/'
    expect({ get: '/' }).to route_to controller: 'site', action: 'home'
  end

  it 'routes GET /home' do
    expect(home_path).to eq '/home'
    expect({ get: '/home' }).to route_to controller: 'users', action: 'home'
  end
end
