class CreateCategoryPostRelationships < ActiveRecord::Migration
  def change
    create_table :category_post_relationships do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
  end
end
