class Office < ActiveRecord::Base
  has_many :work_stations
  belongs_to :branches_department
end
