class DashboardController < ApplicationController

  def index
    @jobs_by_interest = Job.by_interest
    @jobs_by_location = Job.by_city
    @companies_by_interest = Company.top_three_by_interest
  end

end
