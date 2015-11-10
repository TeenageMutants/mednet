class CreateCompanies < ActiveRecord::Migration
  using(:shard_one)
  def change
    create_table :companies do |t|
      #t.has_many :models
      t.string :name, null: false
    end
  end
end
