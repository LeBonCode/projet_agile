# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Achievement < ActiveRecord::Base
  attr_accessible :title, :description
end
