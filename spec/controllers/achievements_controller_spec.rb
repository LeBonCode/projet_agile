require 'spec_helper'

describe AchievementsController do
  it 'should get new' do
    get 'new'
    assigns[:achievement].should be_a_new(Achievement)
    response.should be_success
  end
  it 'should post create' do
    achievement = FactoryGirl.build(:achievement)
    post 'create', :achievement => { title: achievement.title, description: achievement.description }
    assigns(:achievement).should be_a_kind_of(Achievement)
    assigns(:achievement).should_not be_new_record
    response.should redirect_to new_achievement_path
  end
end
