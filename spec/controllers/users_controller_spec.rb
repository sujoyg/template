require 'rails_helper'

describe UsersController, :type => :controller do
  let(:current_user) { FactoryGirl.create(:user) }

  before do
    controller.stub(:current_user) { current_user }
    controller.stub(:authorize).and_return(true)
  end

  it { should have_before_filter(:authorize) }

  describe "GET home" do
    it "should render." do
      get :home
      expect(response).to be_success
    end
  end
end
