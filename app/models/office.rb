class Office < ActiveRecord::Base

  belongs_to :branches_department
  belongs_to :department, inverse_of: :offices
  belongs_to :branch
  using(:shard_one)

  # default_scope { using :shard_one}
  # db_magic :connection => :shard_one
  validates :number, presence: true
  validates :branches_department_id, presence: true

  has_many :work_stations

  def self.add_office params
    Office.create(branches_department_id: params[:branches_department_id], number: params[:number],
                  floor: params[:floor], block: params[:block], is_deleted: params[:is_deleted])
  end



  def self.office_search params

    if params[:branch_id].present? or params[:department_id].present? or  params[:number].present? or params[:floor].present? or params[:block].present?
      offices = Office.using(:shard_one)
      br_dep = BranchesDepartment

      br_dep = br_dep.where("branch_id =?", params[:branch_id]) if params[:branch_id].present?
      br_dep = br_dep.where("department_id = ?", params[:department_id]) if params[:department_id].present?


      if br_dep.present?
        i = 0
        br_dep_id_ar = []
        br_dep.each do |id|
          br_dep_id_ar[i] = id.id
          i += 1
        end
        offices = offices.where(branches_department_id: br_dep_id_ar)
      end


      offices= offices.where("lower(number) LIKE lower(?)", "%#{params[:number]}%") if params[:number].present?
      offices = offices.where("floor = ?", params[:floor]) if params[:floor].present?
      offices = offices.where("block = ?", params[:block]) if params[:block].present?

    elsif params[:org_id].present?
      branch = Branch.where("organization_id = ?", params[:org_id])
      if branch.present?
        i = 0
        br_ar = []
        branch.each do |branch|
          br_ar[i] = branch.id
          i += 1
        end
      end
      br_dep = BranchesDepartment.where(branch_id: br_ar)
      if br_dep.present?
        i = 0
        br_dep_id_ar = []
        br_dep.each do |id|
          br_dep_id_ar[i] = id.id
          i += 1
        end
      end
      # Office.extra_array(br_dep)

      offices = Office.using(:shard_one).where(branches_department_id: br_dep_id_ar)
      # offices = Office.using(:shard_one).all
    end
    return offices
  end

  def self.extra_array params
    if params.present?
      i = 0
      br_dep_id_ar = []
      params.each do |param|
        br_dep_id_ar[i] = param.id
        i += 1
      end
    end
    return br_dep_id_ar
  end




end
