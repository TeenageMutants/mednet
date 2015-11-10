class Model < ActiveRecord::Base
  belongs_to :company
  belongs_to :type
  has_many :items
  has_many :models_characteristics
  has_many :characteristic, through: :models_characteristics
end
