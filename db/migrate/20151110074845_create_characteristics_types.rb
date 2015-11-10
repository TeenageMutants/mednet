class CreateCharacteristicsTypes < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :characteristics_types do |t|
      t.belongs_to :charactesristic, index: true
      t.belongs_to :types, index: true
    end
  end
end
