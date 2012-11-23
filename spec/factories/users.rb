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
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password 'loremipsum'
    factory :user_with_subscriptions do
      ignore do
        subscriptions_count 5
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:subscription_succeeded, evaluator.subscriptions_count, user: user)
        FactoryGirl.create_list(:subscription_with_achievement, evaluator.subscriptions_count, user: user)
      end
    end
  end
end
