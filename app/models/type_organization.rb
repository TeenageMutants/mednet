class TypeOrganization < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
end
