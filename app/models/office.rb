class Office < ActiveRecord::Base

  belongs_to :branches_department, inverse_of: :offices
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
end
