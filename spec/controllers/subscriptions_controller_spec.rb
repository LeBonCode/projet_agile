require 'spec_helper'

describe SubscriptionsController do
  context '#create' do
    let(:subscription) { FactoryGirl.build(:subscription_with_achievement) }
    def do_create
      post 'create', subscription: { user_id: subscription.user_id, achievement_id: subscription.achievement_id }
    end
    it 'should redirect to achievements index' do
      do_create
      response.should redirect_to achievements_path
    end
    it 'should assign subscription' do
      do_create
      assigns[:subscription].should_not be_new_record
    end
    it 'should assign a flash notice on successful save' do
      Subscription.any_instance.stub(:valid?).and_return(true)
      do_create
      flash[:notice].should_not be_nil
    end
    it 'should not assign a flash notice on failed save' do
      Subscription.any_instance.stub(:valid?).and_return(false)
      do_create
      flash[:notice].should be_nil
    end
    it 'should pass params to vote' do
      do_create
      assigns[:subscription].user_id.should eq(subscription.user_id)
      assigns[:subscription].achievement_id.should eq(subscription.achievement_id)
    end
  end
end
