class Characteristic < ActiveRecord::Base
  has_many :characteristics_types
  has_many :types, through: :characteristics_types
  has_many :models_characteristics
  has_many :models, through: :models_characteristics
end
