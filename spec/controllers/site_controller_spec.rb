require 'rails_helper'

describe SiteController, :type => :controller do
  describe 'GET home' do
    it 'redirects to /home when logged in' do
      controller.stub(:current_user).and_return(FactoryGirl.create :user)
      get :home
      expect(response).to redirect_to home_path
    end

    it 'renders site homepage when not logged in' do
      get :home
      expect(response).to be_success
      expect(response).to render_template 'site/home'
    end
  end
end
