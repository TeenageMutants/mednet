class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :short_name, nil: false
      t.string :full_name, nil: false
      t.belongs_to :type_organization, nil: false
      t.string :phone_city_code
      t.string :reception_phone
      t.string :fax
      t.string :address
      t.string :lsd_id
      t.string :web_site
    end
  end
end
