class CreateCharacteristicsTypes < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :characteristics_types do |t|
      t.belongs_to :characteristic, index: true
      t.belongs_to :type, index: true
    end
  end
end
