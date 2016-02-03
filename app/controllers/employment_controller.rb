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
      redirect_to user_path(@employment.user_id), notice: "New Position Added"
      #render plain: @employment.user_id
    else
      redirect_to employment_new_path, notice: "Sorry, there was an error."
    end

  end

  def edit
    @employment_to_edit = Employment.find params[:id]
    @employment_id = params[:id]
    @companies = Company.all.order(:name)
  end

  def update
    @employment = Employment.find (params[:employment_id])
    if @employment.update(edit_employment_params)
      redirect_to user_path(@employment.user), notice: "Position Edited"
    else
      render plain: "There was a problem updating the record"
    end

  end

  def destroy
    employment_to_edit = Employment.find params[:id]
    employment_to_edit.destroy
    redirect_to user_path(employment_to_edit.user), notice: "Position deleted"
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
