class SearchController < ApplicationController

  def index
  end

  def results

    # use a named variable called query_term for term
    query_term = params[:q]

    #conduct the search in the controller
    @user = User.where("fname like ?", "%#{query_term}%")



  end

end
