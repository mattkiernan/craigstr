class Category < ActiveRecord::Base
  belongs_to :region
  has_many :posts
end
