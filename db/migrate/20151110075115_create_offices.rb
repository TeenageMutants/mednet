class CreateOffices < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :offices do |t|
      # t.has_many :work_stations
      t.belongs_to :branches_department, index: true
      t.string :number
      t.integer :floor
      t.integer :block
      t.boolean :is_deleted
      t.timestamps null: false
    end
  end
end
