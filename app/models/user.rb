# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :achievements, through: :subscriptions
  has_many :subscriptions
end
