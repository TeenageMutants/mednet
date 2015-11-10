class ModelsCharacteristic < ActiveRecord::Base
  belongs_to :characteristic
  belongs_to :model
end
