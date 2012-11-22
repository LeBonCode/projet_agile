class UsersController < ApplicationController
  def show
    @succeeded_subscriptions = User.find(params[:id]).subscriptions.succeeded
    @not_succeeded_subscriptions = User.find(params[:id]).subscriptions.not_succeeded
    @fake_current_user = User.first
  end
end
