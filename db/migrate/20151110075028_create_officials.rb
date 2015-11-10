class CreateOfficials < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :officials do |t|
      t.belongs_to :department, index: true
      t.belongs_to :position, index: true
      # t.has_many :work_stations
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :phone
      t.timestamps null: false
    end
  end
end
