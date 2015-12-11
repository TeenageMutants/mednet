class Department < ActiveRecord::Base
<<<<<<< HEAD
  has_many :branches_departments
  has_many :branches, through: :branches_departments
=======
  belongs_to :branch
  has_many :branches_departments
  using(:shard_one)
  has_many :offices, through: :branches_departments

  def self.add_department params
    @department = Department.create(name: params[:name])
  end
>>>>>>> origin/Klavakurochkina
end
