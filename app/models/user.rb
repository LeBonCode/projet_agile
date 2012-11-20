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
end
