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

class Vote < ActiveRecord::Base
  attr_accessible :user_id, :subscription_id
  belongs_to :user
  belongs_to :subscription
end
