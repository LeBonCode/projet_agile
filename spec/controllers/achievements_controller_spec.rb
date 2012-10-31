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

  it 'should get index' do
    achievements = FactoryGirl.create_list(:achievement, 10)
    get 'index'
    assigns[:achievements].should eq(Achievement.all)
  end

  it 'should get show' do
    achievement = FactoryGirl.create(:achievement)
    get 'show', id: achievement.id
    assigns[:achievement].should eq(achievement)
  end
end
