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

require 'spec_helper'

describe Vote do
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:subscription_id) }
  it { should belong_to(:user) }
  it { should belong_to(:subscription) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:subscription) }
end
