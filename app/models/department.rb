class Department < ActiveRecord::Base
  has_many :branches_departments
  has_many :branches, through: :branches_departments
end
