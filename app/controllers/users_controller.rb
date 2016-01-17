class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @users = User.paginate(page: params[:page])
    @users = User.includes(:companies).search(params[:keyword]).filter(params[:filter]).paginate(page: params[:page])
    @companies = Company.all
  end

  def show
  end


  private

  def set_company
    @users = User.find(params[:id])
  end

end
