class CohortController < ApplicationController

  def index
    @cohorts = Cohort.all
    @cohorts.order!(name: :asc)
  end

  def show
    @cohort = Cohort.find (params[:id])
  end
end
