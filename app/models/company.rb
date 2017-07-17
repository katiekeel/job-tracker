class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy


  def self.top_three_by_interest
    byebug
    companies = Company.all
    companies = companies.each do |company|
      company.jobs.group_by(&:level_of_interest)
    end
    companies
  end

end
