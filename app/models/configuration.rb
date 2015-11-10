class Configuration < ActiveRecord::Base
  belongs_to :item
  belongs_to :work_station
end
