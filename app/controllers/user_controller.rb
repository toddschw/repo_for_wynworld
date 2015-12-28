class UserController < ApplicationController

  def index
    @users = User.where("role != ?", "admin")
    @users.order!(lname: :asc)

  end

end
