class ActivityController < ApplicationController
  
  before_filter :authenticate_user!
  def index
    if(params.has_key?(:user_show))
      @activities=current_user.activities
    else
      @hometown=current_user.home_city
      @activities = Activity.where('country'=>@hometown).order("score").reverse
    end
  end
  
  def mysubmission
    puts "hello world"
    redirect_to activity_index_path(:user_show => true)
  end

  
  def new
    @newActivity = Activity.new
    @hometown=current_user.home_city
  end

  def create
     @activity = Activity.new(params[:activity])
     @activity.score = 0;
     #@activity.country=current_user.home_city
     @activity.save
     
     current_user.activities << @activity
     current_user.save
     redirect_to activity_index_path

  end

  def update
    @updateActivity = Activity.find(params[:id])
    @updateActivity.update_attributes(params[:activity])
    @updateActivity.save
    redirect_to activity_path(@updateActivity.id)

  end

  def edit
    @editActivity = Activity.find(params[:id])
    
  end

  def destroy
    @deleteActivity = Activity.find(params[:id])
    @deleteActivity.delete
  end
  def upvote
    @activity = Activity.find(params[:id])
    @activity.score = @activity.score + 1 
    @activity.save
    redirect_to activity_index_path
  end
  def downvote
    @activity = Activity.find(params[:id])
    @activity.score = @activity.score - 1 
    @activity.save
    redirect_to activity_index_path
  end  
  def show
    @showActivity = Activity.find(params[:id])

  end
end
