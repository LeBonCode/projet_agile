class VotesController < ApplicationController
  def create
    subscription = Subscription.find(params[:vote][:subscription_id])
    redirect_to subscription.user
  end
end
