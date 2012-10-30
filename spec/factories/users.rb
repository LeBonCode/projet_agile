# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :user_with_subscriptions do
      ignore do
        subscriptions_count 5
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:subscription_with_achievement, evaluator.subscriptions_count, user: user)
      end
    end
  end
end
