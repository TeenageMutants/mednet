class Official < ActiveRecord::Base
  using(:shard_one)
  belongs_to :branches_department
  belongs_to :position
  has_many :work_stations
end
