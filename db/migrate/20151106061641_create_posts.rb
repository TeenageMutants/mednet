class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title, null:false
      t.text :body, null:false
      t.belongs_to :user, index: true, null: false
      t.boolean :closed
      t.boolean :attached



      t.timestamps null: false
    end
  end
end
