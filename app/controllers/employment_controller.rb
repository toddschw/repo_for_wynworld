class EmploymentController < ApplicationController

  before_filter :authenticate_user!
  before_action :admin_user


  def new
    @companies = Company.all.order(:name)
    @user_id = params[:user_id]

  end

  def create
    # render json: params.to_json
    #render json: new_employment_params.to_json

    @employment = Employment.new(new_employment_params)


    if @employment.save
      render plain: @employment.inspect
      #redirect_to user_path(@employment.user_id)
      #render plain: @employment.user_id

    else
      render plain: "Error"
    end

  end

  def edit
    @employment_to_edit = Employment.find params[:id]
    @companies = Company.all.order(:name)
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

def new_employment_params
  params.require(:new_employment).permit(:jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date, :current, :company_id, :user_id)
end

def edit_employment_params
  params.require(:employment_to_edit).permit(:jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date, :current, :company_id, :user_id)
end
