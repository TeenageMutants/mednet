class Item < ActiveRecord::Base
  belongs_to :model
  belongs_to :state
  has_many :configurations
  has_many :work_stations, through: :configurations
end
