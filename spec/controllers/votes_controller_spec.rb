require 'spec_helper'

describe VotesController do
  let(:vote) { FactoryGirl.build(:vote) }
  context'#create' do
    it 'should redirect to user show with a notice on successful save' do
      Vote.any_instance.stub(:valid?).and_return(true)
      post 'create', vote: { subscription_id: vote.subscription_id }
      assigns[:vote].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(user_path(vote.subscription.user_id))
    end

    it 'should re-render new template on failed save' do
      Vote.any_instance.stub(:valid?).and_return(false)
      post 'create', vote: { subscription_id: vote.subscription_id }
      assigns[:vote].should be_new_record
      flash[:notice].should be_nil
      response.should redirect_to(user_path(vote.subscription.user_id))
    end

    it 'should pass params to vote' do
      post 'create', vote: { user_id: vote.user_id, subscription_id: vote.subscription_id }
      assigns[:vote].user_id.should eq(vote.user_id)
      assigns[:vote].subscription_id.should eq(vote.subscription_id)
    end
  end
end
