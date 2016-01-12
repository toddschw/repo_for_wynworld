class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end


  private

  def set_company
    @users = User.find(params[:id])
  end

end
