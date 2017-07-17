class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.by_city
    jobs = Job.all
    jobs = jobs.group_by(&:city)
    jobs
  end

  def self.by_interest
    jobs = Job.all
    jobs = jobs.group_by(&:level_of_interest).sort.reverse
    jobs
  end

end
