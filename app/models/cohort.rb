class Cohort < ActiveRecord::Base
  has_many :users

  validates :name, :location, :graddate, presence: true
end
