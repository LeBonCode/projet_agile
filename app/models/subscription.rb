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
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :achievement
end
