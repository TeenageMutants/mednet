class CreateTypeOrganizations < ActiveRecord::Migration
  def change
    create_table :type_organizations do |t|
      t.string :name, null: false
    end
  end
end
