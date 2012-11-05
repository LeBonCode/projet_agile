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
  has_many :subscriptions, through: :votes
  has_many :votes

  def vote_for(subscription_id)
    v = votes.new
    v.subscription_id = subscription_id
  end
end
