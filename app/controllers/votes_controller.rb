#encoding: UTF-8
class VotesController < ApplicationController
  def create
    subscription = Subscription.find(params[:vote][:subscription_id])
    @vote = Vote.create
    if !@vote.new_record? then
      flash[:notice] = 'Votre vote a bien été enregistré'
    end
    redirect_to subscription.user
  end
end
