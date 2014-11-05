class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :region_id
      t.integer :category_id

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :region_id
    add_index :posts, :category_id
  end
end
