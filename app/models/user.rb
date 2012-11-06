# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :achievements, through: :subscriptions
  has_many :subscriptions
  has_many :voted_subscriptions, through: :votes
  has_many :votes

  def vote_for(subscription_id)
    vote = votes.new
    vote.subscription_id = subscription_id
    vote.save
  end
end
