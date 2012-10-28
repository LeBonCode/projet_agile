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

require 'spec_helper'

describe Achievement do
  it { should respond_to(:title) }
  it { should respond_to(:description) }
end
