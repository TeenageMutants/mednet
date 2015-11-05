class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.belongs_to :organization, nil: false
      t.string :short_name, nil: false
      t.string :full_name, nil: false
      t.string :senior_phone
      t.string :address
    end
  end
end