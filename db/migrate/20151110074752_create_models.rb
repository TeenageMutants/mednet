class CreateModels < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :models do |t|
      t.belongs_to :company, index: true
      t.belongs_to :type, index: true
      t.boolean :is_request
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
