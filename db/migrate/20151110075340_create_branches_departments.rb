class CreateBranchesDepartments < ActiveRecord::Migration
  def change
    create_table :branches_departments do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :department, index: true
    end
  end
end

