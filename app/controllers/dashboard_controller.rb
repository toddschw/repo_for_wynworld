class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    # if current_user.role == 'admin'
    #   @role = 'Admin'
    # elsif current_user.role == 'student'
    #   @role = 'Student'
    # end

    if current_user.admin
      @users =  User.where(admin: false)
      @table_label = "All WynAlums"
     else
      @users = current_user.cohort.users
      @table_label = "My Cohort"
    end

    @company = Company.all


  end

  def ind_employment

    @user = User.find params[:id]
    @employments = @user.employments
  end

  def ind_list
    @users = User.where('role != ?', 'admin')
    @users.order!(lname: :asc)
  end

  def cohort_list
    @cohorts = Cohort.all
    @cohorts.order!(name: :asc)
  end


end
