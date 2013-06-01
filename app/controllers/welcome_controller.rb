class WelcomeController < ApplicationController
#  before_filter :authenticate_user!
  def index
    if current_user
      @somerubycode = "Hello World!"
    end
  end
end
