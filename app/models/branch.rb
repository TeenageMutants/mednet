class Branch < ActiveRecord::Base
<<<<<<< HEAD
  has_many :branches_departments
  has_many :departments, through: :branches_departments
=======
  belongs_to :organization
  has_many :branches_departments
  has_many :departments, through: :branches_departments
  using(:shard_one)
  has_many :offices, through: :branches_departments
  def self.add_branch params
    @branch = Branch.create(organization_id: params[:organization_id], short_name: params[:short_name],
                            full_name: params[:full_name], senior_phone: params[:senior_phone],
                            address: params[:address])
  end



>>>>>>> origin/Klavakurochkina
end
