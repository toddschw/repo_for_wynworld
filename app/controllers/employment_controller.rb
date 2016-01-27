class EmploymentController < ApplicationController

  before_filter :authenticate_user!
  before_action :admin_user


  def new
    @last_employment = Employment.last
    @companies = Company.all.order(:name)
  end

  def create
    #render json: employment_params.to_json
    #render json: params.to_json
     @employment = Employment.new(employment_params)

    #render plain: @employment.inspect

    if @employment.save
      render plain: @employment.inspect
    else
      render plain: "Error"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def admin_user
  redirect_to root_url unless current_user.admin
end

def employment_params
  params.require(:last_employment).permit(:jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date, :current, :company_id, :user_id)
end
