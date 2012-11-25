class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @succeeded_subscriptions = User.find(params[:id]).subscriptions.succeeded
    @not_succeeded_subscriptions = User.find(params[:id]).subscriptions.not_succeeded
  end
end
