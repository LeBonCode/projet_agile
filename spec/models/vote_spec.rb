# == Schema Information
#
# Table name: votes
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Vote do
  matcher :have_constant do |const|
    match do |owner|
      (owner.is_a?(Class) ? owner : owner.class).const_defined?(const)
    end
  end

  let(:vote) { FactoryGirl.build(:vote) }

  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:subscription_id) }
  it { should belong_to(:user) }
  it { should belong_to(:subscription) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:subscription) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:subscription_id) }
  it { should have_constant(:VOTES_NUMBER) }

  it 'should have after save callbacks : validate_objective!' do
    vote.should_receive(:validate_objective!)
    vote.run_callbacks(:save) { true }
  end

  it 'should validate an objective if it have the number of votes' do
    vote.subscription.votes.stub(:count).and_return(Vote::VOTES_NUMBER)
    expect{ vote.save }.to change{ vote.subscription.succeeded }.from(false).to(true)
  end

  it 'should not validate an objective if it have not the number of votes' do
    Vote::VOTES_NUMBER-1.times do |i|
      vote.subscription.votes.stub(:count).and_return(i)
      expect{ vote.save }.to_not change{ vote.subscription.succeeded }.to(true)
    end
  end
end
