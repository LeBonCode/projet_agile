class UsersController < ApplicationController
  def show
    @succeeded_subscriptions = User.find(params[:id]).subscriptions.succeeded
  end
end
