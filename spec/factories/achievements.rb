#encoding: UTF-8
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


FactoryGirl.define do
  factory :achievement do
    title 'Réussir le projet à gilles'
    description   'Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing
                  elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Lorem ipsum dolor sit
                  amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis
                  lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat
                  porttitor ligula, eget lacinia odio sem nec elit.'
    after(:create) do |achievement, evaluator|
      achievement.badge = File.open(Dir.glob(File.join(Rails.root, 'spec/factories/images/badges', '*')).sample)
      achievement.save
    end
  end
end
