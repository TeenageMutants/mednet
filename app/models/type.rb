class Type < ActiveRecord::Base
  has_many :models
  has_many :characteristics_types
  has_many :characteristics, through: :characteristics_types
end
