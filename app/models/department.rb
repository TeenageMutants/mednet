class Department < ActiveRecord::Base
  belongs_to :branch
  has_many :branches_departments
  using(:shard_one)
  has_many :offices, through: :branches_departments

  def self.add_department params
    @department = Department.create(name: params[:name])
  end
end
