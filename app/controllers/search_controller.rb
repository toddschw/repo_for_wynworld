class SearchController < ApplicationController

  def index
  end

  def results

    # use a named variable called query_term for term
    query_term = params[:q]

    #conduct the search in the controller
    @user = User.where("fname like ?", "%#{query_term}%")

    # Don't include companies in search results, for now
    # @company = Company.where("name like ?", "%#{query_term}%")

    respond_to do |format|
            format.html { render plain: "This is HTML" }
            format.js
            format.json { render json: @user }
        end

  end

end
