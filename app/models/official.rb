class Official < ActiveRecord::Base
  using(:shard_one)
  belongs_to :branches_department
  belongs_to :position
  has_many :work_stations

  # validates :phone, presence: true, format: { with: '^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$'}
  # validates :name,  presence: true, format: { with: '^[a-zA-Zа-яА-Я]+$/ui'}
  # validates :surname,  presence: true, format: { with: '^[a-zA-Zа-яА-Я]+$/ui'}
  # validates :patronymic,  presence: true, format: { with: '^[a-zA-Zа-яА-Я]+$/ui'}

  def self.official_add params
    Official.create(name: params[:name],
                    surname: params[:surname],
                    patronymic: params[:patronymic],
                    phone: params[:phone],
                    branches_department_id: params[:branches_department_id])
  end
  def self.official_update official_id, params
    Official.find(official_id).update(name: params[:name],
                                      surname: params[:surname],
                                      patronymic: params[:patronymic],
                                      phone: params[:phone],
                                      branches_department_id: params[:branches_department_id])
  end
  # def self.official_branch_show branch_id
  #   p Official.where(branches_department_id: 1)#(BranchesDepartment.where(branch_id: branch_id)))
  # end

end
