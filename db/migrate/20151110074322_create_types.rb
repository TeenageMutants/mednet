class CreateTypes < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :types do |t|
      # t.has_many :models
      # t.has_many :characteristics_types
      # t.has_many :characteristics, through: :characteristics_types
      t.string :name, null: false
    end
  end
end
