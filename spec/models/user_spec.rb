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

    it 'calls user.votes.new' do
      user.votes.should_receive(:new)
      user.vote_for(subscription.id)
    end
  end
end
