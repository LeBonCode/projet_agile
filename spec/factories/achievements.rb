#encoding: UTF-8
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


FactoryGirl.define do
  factory :achievement do
    title 'Réussir le projet à gilles'
    description   'Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing
                  elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Lorem ipsum dolor sit
                  amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum. Vivamus sagittis
                  lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat
                  porttitor ligula, eget lacinia odio sem nec elit.'
  end
end
