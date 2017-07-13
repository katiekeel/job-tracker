class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :job_categories
  has_many :jobs, through: :job_categories
end
