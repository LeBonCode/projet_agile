# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  it { should have_many(:achievements).through(:subscriptions) }
  it { should have_many(:voted_subscriptions).through(:votes) }
end
