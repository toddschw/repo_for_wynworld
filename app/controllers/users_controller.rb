class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy, :new, :create]


  def index
    # @users = User.paginate(page: params[:page])
    @users = User.includes(:companies).search(params[:keyword]).filter(params[:filter]).paginate(page: params[:page])
    @companies = Company.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to @users, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @users }
      else
        format.html { render :edit }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def user_params
    params.require(:user).permit(:fname, :lname)
  end

  def set_user
    @users = User.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin || @users == current_user
  end


end
