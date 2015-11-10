class CreateConfigurations < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :configurations do |t|
      t.belongs_to :item, index: true
      t.belongs_to :work_station, index: true
      t.timestamp :install_at
      t.timestamp :uninstall_at
      t.boolean :is_current
      t.timestamps null: false
    end
  end
end
