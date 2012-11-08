require 'spec_helper'

describe VotesController do
  let(:user) { FactoryGirl.create(:user_with_subscriptions) }
  let(:current_user) { FactoryGirl.create(:user) }
  it 'should post create' do
    post 'create', vote: { user_id: current_user.id, subscription_id: user.subscriptions.first.id }
    response.should redirect_to user
  end
end
