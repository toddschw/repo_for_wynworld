class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index

    if current_user.admin == false
      @cohort_users = current_user.cohort.users
    end

    @users =  User.where(admin: false)

    #@map_data = #["Google","somedude",37.3860517,-122.0838511],

    # companies with 1 wyncoder
    @employments = Employment.where(current: true)





  end




end
