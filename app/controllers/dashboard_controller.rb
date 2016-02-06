class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index

    if current_user.admin == false
      @cohort_users = current_user.cohort.users
    end

    @users =  User.where(admin: false)

    @company = Company.all

    @employments = Employment.order(:start_date).reverse_order

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
