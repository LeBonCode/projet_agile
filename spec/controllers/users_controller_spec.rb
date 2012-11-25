require 'spec_helper'

describe UsersController do
  let(:user) {  FactoryGirl.create(:user_with_subscriptions) }

  it 'should get show' do
    get 'show', id: user.id
    assigns[:succeeded_subscriptions].should eq(user.subscriptions.succeeded)
    assigns[:not_succeeded_subscriptions].should eq(user.subscriptions.not_succeeded)
    assigns[:user].should eq(user)
  end
 end
