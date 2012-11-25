#encoding: UTF-8
class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @subscription = Subscription.create( { user_id: current_user.id, achievement_id: params[:subscription][:achievement_id] } )
    unless @subscription.new_record? then
      flash[:notice] = 'Vous vous êtes bien abonné à cet objectif'
    end
    redirect_to achievements_path
  end
end
