require 'rails_helper'

RSpec.describe 'users/home', :type => :view do
  let(:user) { FactoryGirl.create(:user) }
  before { expect(view).to receive(:current_user).at_least(1).and_return(user) }

  it 'should render a message.' do
    render
    expect(rendered).to match "You are logged in as #{user.email}."
  end
end
