class UsersController < ApplicationController
  def show
    @subscriptions = User.find(params[:id]).subscriptions
  end
end
