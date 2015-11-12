class ModelsCharacteristic < ActiveRecord::Base
  belongs_to :model
  belongs_to :characteristic
end
