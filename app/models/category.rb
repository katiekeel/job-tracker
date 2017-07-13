class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_and_belongs_to_many :jobs
end
