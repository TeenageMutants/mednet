class Branch < ActiveRecord::Base
  has_many :branches_departments
  has_many :departments, through: :branches_departments
end
