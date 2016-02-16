class EmploymentController < ApplicationController

  before_filter :authenticate_user!
  before_action :admin_user_newaction, only: [:new]
  before_action :admin_user_editdeleteaction, only: [:edit, :destroy]
  before_action :admin_user_updateaction, only: [:update]


  def new
    @companies = Company.all.order(:name)
    @user_id = params[:user_id]
    @new_employment = Employment.new
  end

  def create
    #render json: params

    @new_employment = Employment.new(new_employment_params)
    @companies = Company.all.order(:name)
    @user_id = new_employment_params[:user_id]


    #render plain: @employment.inspect

    if @new_employment.save
      redirect_to user_path(@new_employment.user_id), notice: "New Position Added"
      #render plain: @new_employment.inspect
    else
      #redirect_to employment_new_path, notice: "Sorry, there was an error."
      #redirect_to root_path, notice: "Sorry, there was an error."
      #redirect_to new_employment_path(@employment.user_id)
      render "new"

      #render json: { message: "sorry, error", employment: @employment }
    end

  end

  def edit
    @employment_to_edit = Employment.find params[:id]
      @rolenature = @employment_to_edit.rolenature # need this for form
      @rolesource = @employment_to_edit.rolesource  # need this for form
    @employment_id = params[:id]
    @companies = Company.all.order(:name)
    @user = @employment_to_edit.user
  end

  def update

    # render json: params

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

def admin_user_newaction
  redirect_to root_url unless current_user.admin || User.find(params[:user_id]) == current_user
end

def admin_user_editdeleteaction
  redirect_to root_url unless current_user.admin || Employment.find(params[:id]).user == current_user
end

def admin_user_updateaction
  redirect_to root_url unless current_user.admin || Employment.find(params[:employment_id]).user == current_user
end



def new_employment_params
  params.require(:new_employment).permit(:jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date, :current, :company_id, :user_id)
end

def edit_employment_params
  params.require(:employment_to_edit).permit(:jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date, :current, :company_id, :user_id)
end
