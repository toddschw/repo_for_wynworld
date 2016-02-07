class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index

    if current_user.admin == false
      @cohort_users = current_user.cohort.users
    end

    @users =  User.where(admin: false)

    @map_data = [ ["Google","somedude",37.3860517,-122.0838511],["Google","somedude",37.3860517,-122.0838511] ]

    # Code below is used for map
    @employments = Employment.where(current: true)  # Find all current employments

    @array_with_one = []
    @array_with_multiple = []

    @employments.each do |e|
      if @array_with_one.include? e.company.id
        if !@array_with_multiple.include? e.company.id
           @array_with_multiple << e.company.id
         end
      else
        @array_with_one << e.company.id
      end
    end

    @array_with_one = @array_with_one - @array_with_multiple

    @general_array = []
    @array_with_multiple.each do | multi_employer |
      Employment.where(company_id: multi_employer).where(current: true).each do |x|
        @general_array << x.user.fname << x.company.name
      end
    end







  end




end
