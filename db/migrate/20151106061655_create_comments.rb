class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null:false
      # t.decimal :post_id
      t.belongs_to :post, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.string :ancestry

      t.timestamps null: false
    end
  end
end
