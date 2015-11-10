class WorkStation < ActiveRecord::Base
  belongs_to :office
  belongs_to :official
  has_many :configurations
  has_many :items, through: :configurations
end
