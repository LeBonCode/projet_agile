require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user_with_subscriptions)
  end

  it 'should get show' do
    get 'show', id: @user.id
    assigns[:succeeded_subscriptions].should eq(@user.subscriptions.succeeded)
  end
 end
