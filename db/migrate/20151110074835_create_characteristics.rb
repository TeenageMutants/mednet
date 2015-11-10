class CreateCharacteristics < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :characteristics do |t|
      # t.has_many :characteristics_types
      # t.has_many :types, through: :characteristics_types
      # t.has_many :models_characteristics
      # t.has_many :models, through: :models_characteristics
      t.string :name, null: false
      t.string :measure
    end
  end
end
