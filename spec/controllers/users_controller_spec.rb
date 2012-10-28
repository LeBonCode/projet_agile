require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = User.first || FactoryGirl.create(:user)
  end

  it 'should get show' do
    get 'show', id: @user.id
  end

end
