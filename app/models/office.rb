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

  FLOOR = {1 => {name: "1 этаж"}, 2 => {name: "2 этаж"}, 3 => {name: "3 этаж"}, 4 => {name: "4 этаж"}, 5 => {name: "5 этаж"}, 6 => {name: "6 этаж"}, 7 => {name: "7 этаж"}, 8 => {name: "8 этаж"}, 9 => {name: "9 этаж"}}


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


      # offices = offices.order(:number)
    else
      branch = Branch.find_by_organization_id(params[:org_id]).id
      br_dep = BranchesDepartment.where("branch_id = ?", branch)
      i = 0
      br_dep_id_ar = []
      br_dep.each do |id|
        br_dep_id_ar[i] = id.id
        i += 1
      end
      offices = Office.using(:shard_one).where(branches_department_id: br_dep_id_ar)

    end
    # return br_dep
    return offices
  end
end
