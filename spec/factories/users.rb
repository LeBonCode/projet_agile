# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  prenom                 :string(255)
#  nom                    :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password 'loremipsum'
    prenom { Faker::Name.first_name }
    nom { Faker::Name.last_name }
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
