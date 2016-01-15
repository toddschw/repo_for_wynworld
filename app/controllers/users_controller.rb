class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end


  private

  def set_company
    @users = User.find(params[:id])
  end

end
