require 'spec_helper'

describe AchievementsController do
  it 'should get new' do
    get 'new'
    response.should be_success
  end
end
