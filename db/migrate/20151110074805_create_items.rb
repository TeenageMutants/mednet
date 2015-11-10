class CreateItems < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :items do |t|
      t.belongs_to :model, index: true
      t.belongs_to :state, index: true
      # t.has_many :configurations
      # t.has_many :work_stations, through: :configurations
      t.string :serial, null: false
      t.timestamp :buy_at
      t.timestamp :guarantee_to
      t.string :GK
      t.string :code_1c
      t.timestamps null: false
    end
  end
end
