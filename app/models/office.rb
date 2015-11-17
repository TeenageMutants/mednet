class Office < ActiveRecord::Base
  using(:shard_one)
  # default_scope { using :shard_one}
  # db_magic :connection => :shard_one
  validates :number, presence: true
  validates :branches_department_id, presence: true

  has_many :work_stations
  belongs_to :branches_department
end
