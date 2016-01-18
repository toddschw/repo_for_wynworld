class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

def edit
end

def update
  respond_to do |format|
    if @users.update(company_params)
      format.html { redirect_to @users, notice: 'Company was successfully updated.' }
      format.json { render :show, status: :ok, location: @users }
    else
      format.html { render :edit }
      format.json { render json: @users.errors, status: :unprocessable_entity }
    end
  end
end

  private

   def sign_up_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
   end

   def account_update_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password)
   end

   def admin_user
      redirect_to root_url unless current_user.admin
   end

   def set_user
     @users = User.find(params[:id])
   end


end
