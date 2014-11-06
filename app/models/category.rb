class Category < ActiveRecord::Base
  belongs_to :region
  has_many :category_post_relationships
  has_many :posts, through: :category_post_relationships
end
