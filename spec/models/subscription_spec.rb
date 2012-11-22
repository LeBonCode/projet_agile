# == Schema Information
#
# Table name: subscriptions
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  achievement_id :integer
#  succeeded      :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Subscription do
  it { should belong_to :user }
  it { should belong_to :achievement }
  it { should respond_to :succeeded }
  it { should have_many :votes }

  it 'should have succeeded_subscriptions named scope' do
    Subscription.succeeded.to_sql.should eq(Subscription.where(succeeded: true).to_sql)
  end

  it 'should have note_succeeded_subscriptions named scope' do
    Subscription.not_succeeded.to_sql.should eq(Subscription.where(succeeded: false).to_sql)
  end
end
