require 'spec_helper'

describe AchievementsController do
  it 'should get new' do
    get 'new'
    assigns[:achievement].should be_a_new(Achievement)
    response.should be_success
  end
end
