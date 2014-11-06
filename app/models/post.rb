class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :region
  has_many :category_post_relationships
  has_many :categories, through: :category_post_relationships
end
