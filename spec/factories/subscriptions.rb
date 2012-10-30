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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    factory :subscription_with_achievement do
      association :achievement
      factory :subscription_succeeded do
        succeeded true
      end
    end
  end
end
