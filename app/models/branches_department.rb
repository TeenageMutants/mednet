class BranchesDepartment < ActiveRecord::Base
  belongs_to :branch, :dependent => :destroy
  belongs_to :department, :dependent => :destroy
  # using(:shard_one)
  has_many :offices
  def self.add_branch_department params
    BranchesDepartment.create(branch_id: params[:branch_id], department_id: params[:department_id])
  end
end
