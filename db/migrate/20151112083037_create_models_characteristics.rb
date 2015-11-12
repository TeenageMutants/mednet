class CreateModelsCharacteristics < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :models_characteristics do |t|
      t.string :value
      t.belongs_to :model, index: true
      t.belongs_to :characteristic, index: true
    end
  end
end
