class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    if current_user.role == "admin"
      @role = "Admin"
    elsif current_user.role == "student"
      @role =  "Student"
    end

    @cohortName = current_user.cohort
    @user = User.all
    @lat = 25.7822569
    @long = -80.3711658
  end




end
