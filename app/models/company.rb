class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy


  def self.top_three_by_interest
    companies = Company.all
    new_companies = {}
    companies.each do |company|
      new_companies[company] = company.jobs.average(:level_of_interest).to_i
    end
    new_companies
  end

end
