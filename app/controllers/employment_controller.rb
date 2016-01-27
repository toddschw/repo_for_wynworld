class EmploymentController < ApplicationController

  before_filter :authenticate_user!
  before_action :admin_user


  def new
    @last_employment = Employment.last
    @companies = Company.all.order(:name)
  end

  def create
    render json: params.to_json
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
