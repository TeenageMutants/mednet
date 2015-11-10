class CreateModelsCharacteristics < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :models_characteristics do |t|
      t.belongs_to :characteristic, index: true
      t.belongs_to :model, index: true
      t.string :value
    end
  end
end