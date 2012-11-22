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

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement
  has_many :votes

  scope :succeeded, where(succeeded: true)
  scope :not_succeeded, where(succeeded: false)
end
