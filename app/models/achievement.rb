# == Schema Information
#
# Table name: achievements
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  description        :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  badge_file_name    :string(255)
#  badge_content_type :string(255)
#  badge_file_size    :integer
#  badge_updated_at   :datetime
#

class Achievement < ActiveRecord::Base
  attr_accessible :title, :description

  has_attached_file :badge
end
