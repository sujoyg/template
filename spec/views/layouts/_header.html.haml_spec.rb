require 'rails_helper'

RSpec.describe 'layouts/_header', type: :view do
  context 'when logged in' do
    before { allow(view).to receive(:current_account).and_return(FactoryGirl.create :account) }

    it 'renders logout link' do
      render
      assert_select 'a[href=?]', logout_path(redirect: '/'), text: 'Logout'
    end

    it 'does not render login form' do
      render
      assert_select 'form', false
      assert_select 'input[name=?]', 'email', false
      assert_select 'input[name=?]', 'password', false
    end
  end

  context 'when not logged in' do
    before { allow(view).to receive(:current_account).and_return(nil) }

    it 'does not render logout link' do
      render
      assert_select 'a[href=?]', logout_path(redirect: '/'), false
    end


    it 'renders login form' do
      render
      assert_select 'form[action=?] label[for=?]', login_path, 'email'
      assert_select 'form[action=?] input[name=?]', login_path, 'email'

      assert_select 'form[action=?] label[for=?]', login_path, 'password'
      assert_select 'form[action=?] input[name=?]', login_path, 'password'

      assert_select 'form[action=?] input[type=?]', login_path, 'submit'
    end
  end
end
