class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :admin_user, only: [:edit, :update, :destroy, :new, :create]


  def index
    # @users = User.paginate(page: params[:page])
    @users = User.where(admin: false).includes(:companies).search(params[:keyword]).filter(params[:filter]).paginate(page: params[:page])
    @companies = Company.all
  end

  def show
    @employments = @user.employments
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :location, :picurl, :seeking, :reason, :slack, :github, :linkedin, :portfolio)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to root_url unless current_user.admin || @user == current_user
  end


end
