class UserController < ApplicationController

  def index
    @users = User.where("role != ?", "admin")
    @users.order!(lname: :asc)

  end

  def mapper
    @users = User.where("role != ?", "admin")
    @users.order!(lname: :asc)

    @test = "blah"

    respond_to do |format|
      format.html {}
      format.js   {}
      format.json { render json: @users, status: :created, location: @user }
    end
  end


end
