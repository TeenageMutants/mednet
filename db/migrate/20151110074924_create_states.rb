class CreateStates < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :states do |t|
      # t.has_many :items
      t.string :name, null: false
      end
  end
end
