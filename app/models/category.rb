class Category < ActiveRecord::Base

  has_many :posts, :through => :categorizations
  has_many :categorizations
  validates :title, :description, :presence => true

end
