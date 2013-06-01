class ActivityController < ApplicationController
  
  def index
    @activities = Activity.all
  end

  def new
    @newActivity = Activity.new
  end

  def create
  end

  def update
    @updateActivity = Activity.find(params[:id])
  end

  def edit
  end

  def destroy
    @deleteActivity = Activity.find(params[:id])
    @deleteActivity.delete
  end

  def show
    @showActivity = Activity.find(params[:id])

  end
end
