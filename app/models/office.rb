class Office < ActiveRecord::Base
  using(:shard_one)
  # default_scope { using :shard_one}
  # db_magic :connection => :shard_one
  has_many :work_stations
  belongs_to :branches_department
end
