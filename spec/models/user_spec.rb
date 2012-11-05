# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  it { should have_many(:achievements).through(:subscriptions) }
  it { should have_many(:subscriptions).through(:votes) }
  it { should respond_to(:vote_for).with(1).arguments }


  context '#vote_for' do
    let(:user) { FactoryGirl.create(:user) }
    let(:subscription) { FactoryGirl.create(:subscription) }

    before(:each) do
      @vote = user.votes.new
    end

    it 'calls user.votes.new' do
      user.votes.should_receive(:new).and_return(@vote)
      user.vote_for(subscription.id)
    end

    it 'calls vote.subscription_id=' do
      user.votes.stub(:new).and_return(@vote)
      @vote.should_receive(:subscription_id=)
      user.vote_for(subscription.id)
    end

    it 'calls vote.save' do
      user.votes.stub(:new).and_return(@vote)
      @vote.stub(:subscription_id=)
      @vote.should_receive(:save)
      user.vote_for(subscription.id)
    end
  end
end
