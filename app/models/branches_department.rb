class BranchesDepartment < ActiveRecord::Base
  belongs_to :branch
  belongs_to :department
  # using(:shard_one)
  has_many :offices
end
