class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(params[:achievement])
    @achievement.save
    redirect_to new_achievement_path
  end

  def show
    @achievement = Achievement.find(params[:id])
  end
end
