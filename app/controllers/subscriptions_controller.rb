#encoding: UTF-8
class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.create( { user_id: params[:subscription][:user_id], achievement_id: params[:subscription][:achievement_id] } )
    unless @subscription.new_record? then
      flash[:notice] = 'Vous vous êtes bien abonné à cet objectif'
    end
    redirect_to subscriptions_path
  end
end
