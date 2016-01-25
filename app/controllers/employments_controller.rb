class EmploymentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_employment, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :destroy, :update, :create, :new]


  def new
    @employment = Employment.new
  end

  def created
    @employment = Company.new(company_params)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to @employment, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { render :new }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employment.update(company_params)
        format.html { redirect_to @employment, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment }
      else
        format.html { render :edit }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_employment
    #@employment = Employment.find(params[:id]
    #@employment = Employment.where(user_id:params[:id])
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employment_params
    params.require(:employment).permit(:user_id, :company_id, :jobtitle, :roletype, :rolenature, :rolesource, :salary, :start_date, :end_date)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
