class BranchesDepartment < ActiveRecord::Base
  has_many :officials
  has_many :work_stations
  belongs_to :department
  belongs_to :branch
end
