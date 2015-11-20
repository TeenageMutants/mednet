class Organization < ActiveRecord::Base
  belongs_to :type_organization
  has_many :branches
end
