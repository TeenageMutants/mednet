class CreateUserinfos < ActiveRecord::Migration
  def change
    create_table :userinfos do |t|
      t.belongs_to :user, nil: false
      t.string :contact_phone
      t.belongs_to :organization, nil: false
      t.integer :branch_id
      t.belongs_to :position, nil: false
      t.timestamps null: false
    end
  end
end
