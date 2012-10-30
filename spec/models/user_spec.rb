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
  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:achievements).through(:subscriptions) }
end
