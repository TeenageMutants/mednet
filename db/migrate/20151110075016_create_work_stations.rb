class CreateWorkStations < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :work_stations do |t|
      t.belongs_to :office, index: true
      t.belongs_to :official, index: true
      # t.has_many :configurations
      # t.has_many :items, through: :configurations
      t.string :serial, null: false
      t.string :name
      t.boolean :is_deleted
      t.string :ip_address
      t.timestamps null: false
    end
  end
end
