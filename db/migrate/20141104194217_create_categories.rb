class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :region_id

      t.timestamps
    end

    add_index :categories, :region_id
  end
end
